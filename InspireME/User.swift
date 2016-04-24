//
//  User.swift
//  InspireME
//
//  Created by Brad Siegel on 4/23/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

public struct User: JSONEncodable {
    
    var firstName: String
    var lastName: String
    var email: String
    var dateJoined: NSDate?
    //var posts: [Post]
    
    init(sourceDictionary: [String: AnyObject]) {
        self.firstName = sourceDictionary["firstName"] as! String
        self.lastName = sourceDictionary["lastName"] as! String
        self.email = sourceDictionary["email"] as! String
        let dateFormatter = NSDateFormatter() //TODO: - revist this
        dateFormatter.dateFormat = "MM/DD/yy"
        let dateString = sourceDictionary["dateJoined"] as! String
        if let dateJoined = dateFormatter.dateFromString(dateString) {
            self.dateJoined = dateJoined
        }
    }
    
    init(firstName: String,
         lastName: String,
         email: String,
         dateJoined: NSDate) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.dateJoined = dateJoined
    }
    
    //MARK: - JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastNamed"] = self.lastName
        nillableDictionary["email"] = self.email
        nillableDictionary["dateJoined"] = self.dateJoined?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


