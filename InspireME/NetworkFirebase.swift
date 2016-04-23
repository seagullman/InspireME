//
//  NetworkFirebase.swift
//  InspireME
//
//  Created by Brad Siegel on 4/20/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

enum ChildPath: String {
    case Posts = "/posts"
    case Users = "/users"
}

class NetworkFirebase {
    
    static let rootURL = "https://brilliant-torch-5066.firebaseio.com"
    
    class func urlForChildPath(path: ChildPath) -> String {
        return "\(rootURL)\(path)"
    }
}
