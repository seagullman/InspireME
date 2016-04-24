//
//  User.swift
//  InspireME
//
//  Created by Brad Siegel on 4/23/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

public struct User: JSONEncodable {
    
    var firstName: String
    var lastName: String
    var email: String
    var dateJoined: NSDate?
    //var posts: [Post]
    
    init(firstName: String,
         lastName: String,
         email: String,
         dateJoined: NSDate) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateJoined = dateJoined
    }
    
    init(snapshot: FDataSnapshot) {
        self.firstName = snapshot.value["firstName"] as! String
        self.lastName = snapshot.value["lastName"] as! String
        self.email = snapshot.value["email"] as! String
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM/DD/yy"
        let dateString = snapshot.value["dateJoined"] as! String
        if let dateJoined = dateFormatter.dateFromString(dateString) {
            self.dateJoined = dateJoined
        }
    }
    
    //MARK: - JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastName"] = self.lastName
        nillableDictionary["email"] = self.email
        nillableDictionary["dateJoined"] = self.dateJoined?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


