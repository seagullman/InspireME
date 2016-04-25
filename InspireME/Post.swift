//
//  Post.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

public struct  Post: ServerModel {
    var quote: String? 
    var author: String?
    var datePosted: NSDate?

    init(quote: String,
         author: String,
         datePosted: NSDate) {
        self.quote = quote
        self.author = author
        self.datePosted = datePosted
    }
    
    // MARK: - ServerModel
    init(snapshot: FDataSnapshot) {
        self.quote = snapshot.value["quote"] as? String
        self.author = snapshot.value["author"] as? String
        let dateString = snapshot.value["datePosted"] as! String
        if let dateJoined = dateString.dateValue() {
            self.datePosted = dateJoined
        }
    }
    
    public func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["quote"] = self.quote
        nillableDictionary["author"] = self.author
        nillableDictionary["datePosed"] = self.datePosted?.encodeToJSON()
        let dictionary: [String:AnyObject] = JSONUtil.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
