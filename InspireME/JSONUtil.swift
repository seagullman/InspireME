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

extension NSDate {
    func currentDateString() -> String{
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        return formatter.stringFromDate(self)
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

