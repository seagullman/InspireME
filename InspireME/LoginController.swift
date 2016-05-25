//
//  LoginController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

protocol LoginDelegate: class {
    func login(username: String, password: String, completion: (error: NSError?) -> Void)
    func register()
}

extension LoginController: LoginDelegate {

    func login(username: String, password: String, completion: (error: NSError?) -> Void) {
        NetworkFirebase().login(
            username,
            password: password) { (error) in
                
                if error == nil {
                    self.seguePerformer?.navigateWithSegue(
                        "landingScreen",
                        dataForSegue: nil)
                } else {
                    completion(error: error!)
                }
        }
    }
    
    func register() {
        self.seguePerformer?.navigateWithSegue(
            Segue.Register.rawValue,
            dataForSegue: nil)
    }
}

class LoginController: UIViewController,
                       RequiresSeguePerformer {
    

    @IBOutlet private var loginView: LoginView!
    private var seguePerformer: SeguePerformer?
    
    override func viewDidLoad() {
        self.loginView.loginDelegate = self
        populateUsernameAndPasswordFromSettingsBundle()
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    //MARK: Private functions
    private func populateUsernameAndPasswordFromSettingsBundle() {
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let savedUsername = userDefaults.objectForKey("loginUsername") as? String ?? ""
        let savedPassword = userDefaults.objectForKey("loginPassword") as? String ?? ""
        self.loginView?.provideUsernameAndPassword(
            savedUsername,
            password: savedPassword)
    }
}
