//
//  QuoteCard.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

public struct  QuoteCard: JSONEncodable {
    var id: String?
    var quote: String? 
    var author: String?
    var user: String? //should this be here?
    var datePosted: NSDate?
    
    public init?(sourceDictionary: Dictionary<String, AnyObject>) {
        self.id = sourceDictionary["id"] as? String
        self.quote = sourceDictionary["quote"] as? String
        self.quote = sourceDictionary["author"] as? String
        self.user = sourceDictionary["user"] as? String
        self.datePosted = NSDate.create(sourceDictionary["datePosted"])
    }
    
    // MARK: - JSONEncodable
    public func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["id"] = self.id
        nillableDictionary["quote"] = self.quote
        nillableDictionary["user"] = self.user
        nillableDictionary["datePosed"] = self.datePosted?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
