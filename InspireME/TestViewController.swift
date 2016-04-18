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
                          RequiresFirebaseReference,
                          RequiresSeguePerformer {
    
    private var firebaseRef: Firebase?
    private var seguePerformer: SeguePerformer?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var responseLabel: UILabel!
    
    //MARK: - RequiresFirebase
    func setFirebaseReference(firebaseRef: Firebase) {
        self.firebaseRef = firebaseRef
        setupFirebaseObservers()
    }
    
    private func setupFirebaseObservers() {
        self.firebaseRef?.observeEventType(.Value, withBlock: { (snapshot) in
                self.responseLabel.text = snapshot.value as? String
        })
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    @IBAction func sendToFIrebase(sender: AnyObject) {
        var testDic = [String: String]()
        testDic["username"] = "blsiege"
        testDic["password"] = "password"
        testDic["email"] = "blsiege@suh.com"
        testDic["joined"] = "4/17/2016"
        
        firebaseRef?.childByAutoId().setValue(testDic)
    }
}
