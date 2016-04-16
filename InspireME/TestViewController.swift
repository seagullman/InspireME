//
//  TestViewController.swift
//  InspireME
//
//  Created by Brad Siegel on 4/16/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class TestViewController: UIViewController,
                          RequiresFirebase,
                          RequiresSeguePerformer {
    
    private var firebaseRef: Firebase?
    private var seguePerformer: SeguePerformer?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    //MARK: - RequiresFirebase
    func setFirebase(firebaseRef: Firebase) {
        self.firebaseRef = firebaseRef
        
        self.firebaseRef?.observeEventType(.Value, withBlock: { (snapshot) in
            self.responseLabel.text = snapshot.value as? String
        })
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    @IBAction func sendToFIrebase(sender: AnyObject) {
        firebaseRef?.setValue(textField.text)
    }
}
