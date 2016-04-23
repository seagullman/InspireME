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
    //var posts: [Post]
    
    init(source: [String: AnyObject]) {
        self.firstName = source["firstName"] as? String
        self.lastName = source["lastName"] as? String
    }
    
    //MARK: - JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["firstName"] = self.firstName
        nillableDictionary["lastNamed"] = self.lastName
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}


