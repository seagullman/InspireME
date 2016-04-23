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
    func currentDate() -> String{
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.ShortStyle
        return formatter.stringFromDate(self)
    }
}

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
                        let user = User(sourceDictionary:[
                            "id": auth.uid,
                            "firstName": "\(self.emailField.text!)", //TODO: change this once registration screen is done
                            "lastName": "Siegel",
                            "dateJoined": "\(NSDate().currentDate())"]
                        )
                        
                        self.firebaseRef.childByAppendingPath("\(ChildPath.Users.rawValue)/\(auth.uid)").setValue(user.encodeToJSON())
                        
                        self.seguePerformer?.navigateWithSegue(
                            "landingScreen",
                            dataForSegue: nil)
                })
            } else {
               self.errorLabel.text = error.firebaseDescription()
            }
        }
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
}
