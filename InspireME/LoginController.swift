//
//  LoginController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class LoginController: UIViewController,
                       RequiresSeguePerformer {
    
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var emailField: UITextField!
    @IBOutlet private weak var errorLabel: UILabel!
    
    private var seguePerformer: SeguePerformer?
    
    @IBOutlet var swipeRecognizer: UISwipeGestureRecognizer!
    
    override func viewWillAppear(animated: Bool) {
        self.errorLabel.text = nil
        self.swipeRecognizer.direction = .Up
    }
    
    @IBAction func login(sender: AnyObject) {
        NetworkFirebase().login(
            self.emailField.text!,
            password: passwordField.text!) { (error) in
                
            if error == nil {
                self.seguePerformer?.navigateWithSegue(
                    "landingScreen",
                    dataForSegue: nil)
            } else {
                self.errorLabel.text = error?.firebaseDescription()
            }
        }
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
