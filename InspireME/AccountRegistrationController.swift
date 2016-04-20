//
//  AccountRegistrationController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//
//TODO: - move this somewhere else and possibly refactor
enum FirebaseError: String {
    case EmailTaken = "This email address is already registered to an account."
    case EmptyPassword = "Password cannot be blank. Please enter a password."
    case InvalidEmail = "Please enter a valid email address."
}

func errorTextForCode(errorCode: String) -> String {
    var error: String
    switch errorCode {
    case "-5":
        error = FirebaseError.InvalidEmail.rawValue
    case "-6":
        error = FirebaseError.EmptyPassword.rawValue
    case "-9":
        error = FirebaseError.EmailTaken.rawValue
    default:
         error = "Oops, something went wrong."
    }
    return error
}

import UIKit
import Firebase

class AccountRegistrationController: UIViewController,
                                     RequiresSeguePerformer,
                                     RequiresFirebaseReference {
    
    private var seguePerformer: SeguePerformer?
    private var firebaseRef: Firebase?
    
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    @IBAction func createAccount(sender: AnyObject) {
        self.firebaseRef?.createUser(
        emailField.text,
        password: passwordField.text) { (error: NSError!) in
            if error == nil {
                //authenticate user if creation was successful
                self.firebaseRef?.authUser(
                    self.emailField.text,
                    password: self.passwordField.text,
                    withCompletionBlock: { (error, auth) -> Void in
                                    self.seguePerformer?.navigateWithSegue(
                                        "landingScreen",
                                        dataForSegue: nil)
                })
            } else {
               self.errorLabel.text = errorTextForCode(error.code.description)
            }
        }
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
