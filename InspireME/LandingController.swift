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
    let firebaseRef = Firebase(url: NetworkFirebase.rootURL)
    var viewModel: PostsViewModel?

    @IBAction func logout(sender: AnyObject) {
        NetworkFirebase().logout()
        performer?.navigateWithSegue("registration", dataForSegue: nil)
    }
    @IBAction func createPost(sender: AnyObject) {
        NetworkFirebase().createPost(
            Post(quote: "I will forever suhh dude.", author: "B-RAD", datePosted: NSDate())) { (error) in
            print("Quote posted!")
        }
    }
    @IBAction func getPosts(sender: AnyObject) {
        NetworkFirebase().getPosts { (posts, error) in
            if error == nil {
                for post in posts {
                    print("\(post.datePosted)")
                }
            }
        }
    }
    
    override func viewDidLoad() {
        
       NetworkFirebase().getPosts { (posts, error) in
            self.viewModel = PostsViewModel(posts: posts)
        }
        
//        NetworkFirebase().getUsers { (users, error) in
//            let usersArray = users
//            for user in usersArray {
//                print("Name: \(user.firstName) \(user.lastName) Date: \(user.dateJoined)")
//            }
//        }
    }
}
