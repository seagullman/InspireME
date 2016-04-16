//
//  InspirationCard.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

/** Server model*/

//TODO: move this somewhere else
private let dateFormatter = { () -> NSDateFormatter in
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSS"
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    dateFormatter.timeZone = NSTimeZone.localTimeZone()
    return dateFormatter
}()

private let dateFormatterWithTimezone = { () -> NSDateFormatter in
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZZ"
    dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    dateFormatter.timeZone = NSTimeZone.localTimeZone()
    return dateFormatter
}()

private let formatters = [dateFormatter, dateFormatterWithTimezone]

extension NSDate {
    class func create(json: AnyObject?) -> NSDate? {
        guard let string = json as? String else {
            return nil
        }
        
        for formatter in formatters {
            if let date = formatter.dateFromString(string) {
                return date
            }
        }
        return nil
    }
    
    func encodeToJSON() -> AnyObject {
        return dateFormatterWithTimezone.stringFromDate(self)
    }
}

public struct InspirationCard {
    public var id: String?
    public var quote: String?
    public var user: String?
    public var datePosted: NSDate?
    
    public init?(sourceDictionary: Dictionary<String, AnyObject>) {
        self.id = sourceDictionary["id"] as? String
        self.quote = sourceDictionary["quote"] as? String
        self.user = sourceDictionary["user"] as? String
        self.datePosted = NSDate.create(sourceDictionary["datePosted"])
    }
    
    //TODO: logic to encode to JSON
}
