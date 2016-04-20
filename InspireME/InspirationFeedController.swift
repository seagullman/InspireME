//
//  InspirationFeedController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class InspirationFeedController: UIViewController,
                                 RequiresFirebaseReference {
    
    private var firebaseRef: Firebase?
    
    //MARK: - RequiresFirebaseReference
    func setFirebaseReference(firebaseRef: Firebase) {
        self.firebaseRef = firebaseRef
    }
    
}
