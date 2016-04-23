//
//  JSONUtil.swift
//  InspireME
//
//  Created by Brad Siegel on 4/18/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

protocol JSONEncodable {
    func encodeToJSON() -> AnyObject
}

class JSONUtil {
    
    static func rejectNil(source: [String:AnyObject?]) -> [String:AnyObject]? {
        var destination = [String:AnyObject]()
        for (key, nillableValue) in source {
            if let value: AnyObject = nillableValue {
                destination[key] = value
            }
        }
        
        if destination.isEmpty {
            return nil
        }
        
        return destination
    }
}

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

//
// Date formatter for NSDate
//
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
//extension Array : JSONObject {
//    
//    static func create(json: AnyObject?) -> Array? {
//        guard let json = json else {
//            return nil
//        }
//        return Array(json:json)
//    }
//    
//    init?(json: AnyObject) {
//        guard let jsonArray = json as? [AnyObject] else {
//            return nil
//        }
//        self.init()
//        for element in jsonArray {
//            if let type = self.dynamicType.Element.self as? JSONObject.Type {
//                if let newObject = type.create(element) {
//                    self.append(newObject as! Element)
//                }
//            } else {
//                if let newObject = element as? Element {
//                    self.append(newObject)
//                }
//            }
//        }
//}

