//
//  ViewModel.swift
//  InspireME
//
//  Created by Brad Siegel on 4/24/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

protocol ServerModel: JSONEncodable {
    init(snapshot: FDataSnapshot)
}

protocol ViewModel : class, NSCoding {
    
}