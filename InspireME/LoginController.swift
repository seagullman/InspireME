//
//  LoginController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation
import Firebase

class LoginController: UIViewController,
                       RequiresSeguePerformer,
                       RequiresFirebaseReference {

    private var seguePerformer: SeguePerformer?
    private var firebaseRef: Firebase?
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var usernameField: UITextField!
    
    @IBAction func login(sender: AnyObject) {
        
    }

    @IBAction func register(sender: AnyObject) {
        self.seguePerformer?.navigateWithSegue("registration", dataForSegue: nil)
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    //MARK: - RequiresFirebaseReference
    func setFirebaseReference(firebaseRef: Firebase) {
        self.firebaseRef = firebaseRef
    }
}
