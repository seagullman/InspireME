//
//  AccountRegistrationController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

extension NSDate {
    func currentDateString() -> String{
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        return formatter.stringFromDate(self)
    }
}

class AccountRegistrationController: UIViewController,
                                     RequiresSeguePerformer {
    
    @IBOutlet private weak var firstNameField: UITextField!
    @IBOutlet private weak var lastNameField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var confirmPasswordField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    //MARK: - RequiresSeguePerformer
    private var seguePerformer: SeguePerformer?
    
    @IBAction func createAccount(sender: AnyObject) {
            NetworkFirebase().createUser(
                userModel(),
                password: emailField.text!) { (error) in
                    if error == nil {
                        self.seguePerformer?.navigateWithSegue(
                            "landingScreen",
                            dataForSegue: nil)
                    } else {
                        self.errorLabel.text = error?.firebaseDescription()
                    }
        }
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    //MARK: - Private Functions
    private func userModel() -> User {
        return User(firstName: self.firstNameField.text!,
                    lastName: self.lastNameField.text!,
                    email: self.emailField.text!,
                    dateJoined: NSDate())
    }
}
