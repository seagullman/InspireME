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
                       RequiresSeguePerformer {

    private var firebaseRef = Firebase(url: NetworkFirebase.rootURL)
    
    private var seguePerformer: SeguePerformer?
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    @IBAction func login(sender: AnyObject) {
        self.firebaseRef?.authUser(
            self.emailField.text,
            password: self.passwordField.text,
            withCompletionBlock: { (error, auth) -> Void in
                if error == nil {
                    self.seguePerformer?.navigateWithSegue(
                        "landingScreen",
                        dataForSegue: nil)
                    
                } else {
                    self.errorLabel.text = error.firebaseDescription()
                }
        })
    }

    @IBAction func register(sender: AnyObject) {
        self.seguePerformer?.navigateWithSegue(
            Segue.Register.rawValue,
            dataForSegue: nil)
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
}
