//
//  LandingController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/19/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class LandingController: UIViewController,
                         RequiresViewModel {
    
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
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let posts = self.viewModel?.posts
        for post in posts! {
            print("\(post.author) \(post.quote)")
        }
    }
    override func viewDidLoad() {
        
        NetworkFirebase().getPosts { (posts, error) in
            if error == nil {
                for post in posts {
                    print("\(post.datePosted)")
                }
            }
        }

//        NetworkFirebase().getUsers { (users, error) in
//            let usersArray = users
//            for user in usersArray {
//                print("Name: \(user.firstName) \(user.lastName) Date: \(user.dateJoined)")
//            }
//        }
    }
    
    //MARK: - RequiresViewModel
    func createViewModel(completion: (viewModel: ViewModel?, error: ErrorType?) -> Void) {
        NetworkFirebase().getPosts { (posts, error) in
            let viewModel = PostsViewModel(posts: posts)
            completion(viewModel: viewModel, error: error)
        }
    }
    
    override func viewWillAppear(animated: Bool) {


    }
    
    
    func setViewModel(viewModel: ViewModel) {
        if let viewModel = viewModel as? PostsViewModel {
            self.viewModel = viewModel
        }
    }
}
