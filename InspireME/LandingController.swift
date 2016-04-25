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
    @IBAction func createPost(sender: AnyObject) {
        NetworkFirebase().createPost(
        Post(quote: "I will forever suhh dude.", author: "Getter", datePosted: NSDate())) { (error) in
            print("Quote posted!")
        }
    }
    
    override func viewDidLoad() {
//        NetworkFirebase().getUsers { (users, error) in
//            let usersArray = users
//            for user in usersArray {
//                print("Name: \(user.firstName) \(user.lastName) Date: \(user.dateJoined)")
//            }
//        }
    }
}
