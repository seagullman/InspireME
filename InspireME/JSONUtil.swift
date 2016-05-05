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

class DateStringFormatter {
    
    private static let dateFormatter: NSDateFormatter = {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yy"
        return formatter
    }()
    
    static func dateFromString(date: String) -> NSDate? {
        return dateFormatter.dateFromString(date)
    }
    
    static func stringFromDate(date: NSDate?) -> String {
        if let date = date {
            return dateFormatter.stringFromDate(date)
        } else {
            return ""
        }
    }
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

private let dateFormatterShort = { () -> NSDateFormatter in
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter
}()

extension NSDate: JSONEncodable {
    class func create(json: AnyObject?) -> NSDate? {
        guard let string = json as? String else {
            return nil
        }
        return dateFormatterShort.dateFromString(string)
    }
    
    func encodeToJSON() -> AnyObject {
        return dateFormatterShort.stringFromDate(self)
    }
}