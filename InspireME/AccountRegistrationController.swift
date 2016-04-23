//
//  AccountRegistrationController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class AccountRegistrationController: UIViewController,
                                     RequiresSeguePerformer {
    
    private var seguePerformer: SeguePerformer?
    private var firebaseRef = Firebase(url: NetworkFirebase.rootURL)
    
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
                        //TODO: - Handle error != nil here
                        let user = User(source:[
                            "id": auth.uid,
                            "firstName": "\(self.emailField.text!)", //TODO: change this once registration screen is done
                            "lastName": "Siegel"]
                        )
                        
                        self.firebaseRef.childByAppendingPath("\(ChildPath.Users)\(auth.uid)").setValue(user.encodeToJSON())
                        
                        self.seguePerformer?.navigateWithSegue(
                            "landingScreen",
                            dataForSegue: nil)
                })
            } else {
               self.errorLabel.text = ErrorMapper.errorTextForCode(error.code.description)
            }
        }
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
}
