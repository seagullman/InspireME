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
    func createPost(post: Post, completion: (error: NSError?) -> Void)
    func login(email: String, password: String, completion: (error: NSError?) -> Void)
    func logout()
    //func getUsers(completion: (users: [User] , error: NSError?) -> Void)
    func getPosts(completion: (posts: [Post], error: NSError?) -> Void)
    func getPostsByUsername(username: String, completion: (posts: [Post], error: NSError?))
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
                            if let _ = error {
                                //user created sucessfully, error authing user
                                completion(error: error)
                                return
                            }
                            let childPath = self.firebaseRef.childByAppendingPath(
                                "\(ChildPath.Users.rawValue)/\(auth.uid)")
                            childPath.setValue(user.encodeToJSON())
                    })
                } else {
                    completion(error: error)
                }
        }
    }
    
    func createPost(post: Post, completion: (error: NSError?) -> Void) {
        let path = firebaseRef.childByAppendingPath(ChildPath.Posts.rawValue).childByAutoId()
        let uid = firebaseRef.authData.uid
        let userPath = firebaseRef.childByAppendingPath("\(ChildPath.Users.rawValue)/\(uid)/posts")
        
        path.setValue(post.encodeToJSON()) { (error:NSError?, ref:Firebase!) in
            if error == nil {
                //associates post object with the user who  created it
                userPath.updateChildValues(["\(ref.key)":"true"]) //TODO: - determine if a callback block is necessary here
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
    
//    func getUsers(completion: (users: [User] , error: NSError?) -> Void) {
//        
//        let path = self.firebaseRef.childByAppendingPath(ChildPath.Users.rawValue)
//        
//        path.observeSingleEventOfType(.Value, withBlock: { snapshot in
//
//            guard let children = snapshot.children.allObjects as? [FDataSnapshot] else { return }
//            
//            var allUsers = [User]()
//            for child in children {
//                allUsers.append(User(
//                    snapshot: child))
//            }
//            completion(users: allUsers, error: nil)
//        })
//    }
    
    func getPosts(completion: (posts: [Post], error: NSError?) -> Void) {
        let path = self.firebaseRef.childByAppendingPath(ChildPath.Posts.rawValue)
        path.observeSingleEventOfType(.Value, withBlock: { snapshot in
            guard let children = snapshot.children.allObjects as? [FDataSnapshot] else { return }
            var allPosts = [Post]()
            for child in children {
                allPosts.append(Post(snapshot: child)) //TODO: - .map{} ??
            }
            completion(posts: allPosts, error: nil)
        })
    }
    
    func getPostsByUsername(username: String, completion: (posts: [Post], error: NSError?)) {
        
    }
    
    func logout() {
        self.firebaseRef.unauth()
    }
}
