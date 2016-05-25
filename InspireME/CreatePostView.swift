//
//  CreatePostView.swift
//  InspireME
//
//  Created by Brad Siegel on 5/24/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

protocol PostCreationDelegate {
    func postCreated()
}

class CreatePostView: UIView, UITextViewDelegate {
    
    @IBOutlet private weak var authorTextField: UITextField!
    @IBOutlet private weak var quoteTextView: UITextView!
    
    var creationDelegate: PostCreationDelegate?
    
    
    @IBAction func createPost(sender: AnyObject) {
        NetworkFirebase().createPost(
            Post(quote: self.quoteTextView.text,
                author: self.authorTextField.text!,
                datePosted: NSDate())) { (error) in
                    if error == nil {
                        self.creationDelegate?.postCreated()
                    }
        }
    }
    
}
