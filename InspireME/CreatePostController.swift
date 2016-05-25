//
//  CreatePostController.swift
//  InspireME
//
//  Created by Brad Siegel on 5/24/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class CreatePostController: UIViewController {
    
    @IBOutlet private var createPostView: CreatePostView!
    private var performer: SeguePerformer?

    
    override func viewDidLoad() {
        self.createPostView.creationDelegate = self
    }

    @IBAction func dismissKeybaord(sender: AnyObject) {
        self.createPostView.endEditing(true)
    }

}

extension CreatePostController: PostCreationDelegate {
    func postCreated() {
        self.performer?.navigateWithSegue(
            Segue.PostFeed.rawValue,
            dataForSegue: nil)
    }
}

extension CreatePostController: RequiresSeguePerformer {
    func setSeguePerformer(performer: SeguePerformer) {
        self.performer = performer
    }
}
