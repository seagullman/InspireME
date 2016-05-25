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
                         RequiresSeguePerformer {
    
    @IBOutlet private var landingView: LandingView!
    
    private var performer: SeguePerformer?
    let firebaseRef = Firebase(url: NetworkFirebase.rootURL)
    var viewModel: PostsViewModel?

    @IBAction func createPost(sender: AnyObject) {
        self.performer?.navigateWithSegue(
            Segue.CreatePost.rawValue,
            dataForSegue: nil)
    }

    override func viewWillAppear(animated: Bool) {
        self.landingView.displayPosts()
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.performer = performer
    }
}
