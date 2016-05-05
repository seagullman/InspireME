//
//  User.swift
//  InspireME
//
//  Created by Brad Siegel on 4/23/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

public struct User: ServerModel {
    var username: String?
    var firstName: String?
    var lastName: String?
    var email: String?
    var dateJoined: NSDate?
    var posts: [Post]?
    
    init(username: String,
         firstName: String,
         lastName: String,
         email: String,
         dateJoined: NSDate) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateJoined = dateJoined
    }
    
    // MARK: - ServerModel
    init(snapshot: FDataSnapshot) {
        self.username = snapshot.value["username"] as? String
        self.firstName = snapshot.value["firstName"] as? String
        self.lastName = snapshot.value["lastName"] as? String
        self.email = snapshot.value["email"] as? String
        let dateString = snapshot.value["dateJoined"] as? String
        if let dateString = dateString {
            self.dateJoined = DateStringFormatter.dateFromString(dateString)
        }
        //TODO: - set post here
    }
    
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["username"] = self.username
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastName"] = self.lastName
        nillableDictionary["email"] = self.email
        nillableDictionary["dateJoined"] = self.dateJoined?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


