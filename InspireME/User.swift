//
//  User.swift
//  InspireME
//
//  Created by Brad Siegel on 4/23/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

public struct User: JSONEncodable {
    
    var firstName: String?
    var lastName: String?
    var dateJoined: String?
    //var posts: [Post]
    
    init(sourceDictionary: [String: AnyObject]) {
        self.firstName = sourceDictionary["firstName"] as? String
        self.lastName = sourceDictionary["lastName"] as? String
        self.dateJoined = NSDate().currentDate()
    }
    
    //MARK: - JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastNamed"] = self.lastName
        nillableDictionary["dateJoined"] = self.dateJoined
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


