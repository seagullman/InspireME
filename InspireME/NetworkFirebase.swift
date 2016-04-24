//
//  NetworkFirebase.swift
//  InspireME
//
//  Created by Brad Siegel on 4/20/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

enum ChildPath: String {
    case Posts = "/posts"
    case Users = "/users"
}

protocol NetworkInterface: class {
    func createUser(user: User, password: String, completion: (error: NSError?) -> Void)
    func login(email: String, password: String, completion: (error: NSError?) -> Void)
    func logout()
    func getAllUsers(completion: (users: [User] , error: NSError?) -> Void)
}

class NetworkFirebase: NetworkInterface {
    
    static let rootURL = "https://brilliant-torch-5066.firebaseio.com"
    private let firebaseRef = Firebase(url: rootURL)
    
    func createUser(user: User,
                    password: String,
                    completion: (error: NSError?) -> Void) {
        
        self.firebaseRef.createUser(
            user.email,
            password: password) { (error: NSError!) in
                if error == nil {
                    //authenticate user if creation was successful
                    self.firebaseRef?.authUser(
                        user.email,
                        password: password,
                        withCompletionBlock: { (error, auth) -> Void in
                            
                            let childPath = self.firebaseRef.childByAppendingPath("\(ChildPath.Users.rawValue)/\(auth.uid)")
                            childPath.setValue(user.encodeToJSON())
                            
                    })
                }
                    completion(error: error)
        }
    }
    
    func login(email: String,
               password: String,
               completion: (error: NSError?) -> Void) {
        
        self.firebaseRef.authUser(
            email,
            password: password,
            withCompletionBlock: { (error, auth) -> Void in
                completion(error: error)
        })
    }
    
    func getAllUsers(completion: (users: [User] , error: NSError?) -> Void) {
        
        let pathForPosts = self.firebaseRef.childByAppendingPath(ChildPath.Users.rawValue)
        
        pathForPosts.observeSingleEventOfType(.Value, withBlock: { snapshot in

            guard let children = snapshot.children.allObjects as? [FDataSnapshot] else { return }
            
            var allUsers = [User]()
            for child in children {
                allUsers.append(User(
                    snapshot: child))
            }
            completion(users: allUsers, error: nil)
        })
    }
    
    func logout() {
        self.firebaseRef.unauth()
    }
}
