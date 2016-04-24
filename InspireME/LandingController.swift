//
//  LandingController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class LandingController: UIViewController {
    
    private var performer: SeguePerformer?
    
    @IBAction func logout(sender: AnyObject) {
        NetworkFirebase().logout()
        performer?.navigateWithSegue("registration", dataForSegue: nil)
    }
    
    override func viewDidLoad() {
        NetworkFirebase().getAllUsers { (users, error) in
            let usersArray = users
            for user in usersArray {
                print("Name: \(user.firstName) \(user.lastName) Date: \(user.dateJoined)")
            }
        }
    }
}
