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
    var datePosted: String?

    init(source: [String: AnyObject]) {
        self.id = "1"
        self.quote = source["email"] as? String
        self.author = source["joined"] as? String
        self.user = source["password"] as? String
        self.datePosted = source["username"] as? String

    }
    
    // MARK: - JSONEncodable
    public func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
//        nillableDictionary["id"] = self.id
//        nillableDictionary["quote"] = self.quote
//        nillableDictionary["user"] = self.user
//        nillableDictionary["datePosed"] = self.datePosted?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
