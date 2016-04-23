//
//  LandingController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class LandingController: UIViewController {
    
    private var firebaseRef = Firebase(
        url: NetworkFirebase.urlForChildPath(ChildPath.Posts))
    
    override func viewDidLoad() {
        
    }
    
    
    
}
