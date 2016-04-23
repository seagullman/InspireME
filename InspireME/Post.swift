//
//  Post.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

public struct  Post: JSONEncodable {
    var id: String?
    var quote: String? 
    var author: String?
    var userId: String? //should this be here?
    var datePosted: NSDate?

    init(source: [String: AnyObject]) {
        self.id = "1"
        self.quote = source["quote"] as? String
        self.author = source["author"] as? String
        self.userId = source["userId"] as? String
        self.datePosted = NSDate.create(source["datePosted"])

    }
    
    // MARK: - JSONEncodable
    public func encodeToJSON() -> AnyObject {
        let nillableDictionary = [String:AnyObject?]()
//        nillableDictionary["id"] = self.id
//        nillableDictionary["quote"] = self.quote
//        nillableDictionary["user"] = self.user
//        nillableDictionary["datePosed"] = self.datePosted?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
