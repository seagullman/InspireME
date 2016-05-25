//
//  LoginView.swift
//  InspireME
//
//  Created by Brad Siegel on 5/24/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class LoginView: UIView {

    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var usernameField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    var loginDelegate: LoginDelegate?
    
    @IBAction func login(sender: AnyObject) {
        self.loginDelegate?.login(self.usernameField.text!, password: self.passwordField.text!, completion: { (error) in
            if error != nil {
                self.errorLabel.text = error!.firebaseDescription()
            }
        })
    }
    
    @IBAction func register(sender: AnyObject) {
        self.loginDelegate?.register()
    }
    
    func provideUsernameAndPassword(username: String, password: String) {
        self.usernameField.text = username
        self.passwordField.text = password
    }

}
