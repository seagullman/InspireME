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
        self.firebaseRef?.observeEventType(.ChildAdded, withBlock: { (snapshot) in
            print("Response: \(snapshot.children))")
                self.responseLabel.text = snapshot.value as? String
            self.parseResponse(snapshot.value)
        })
    }
    
    func parseResponse(children: [String: AnyObject]) {
        var dict = [String: String]()
        var index = 0

        var quotes = Array<QuoteCard>()
        for childSnap in children {
            quotes.append(QuoteCard(source: childSnap))
        }
        
        let count = 1
    
    }
    
    //MARK: - RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
    
    @IBAction func sendToFIrebase(sender: AnyObject) {
        var testDic = [String: String]()
        testDic["username"] = self.textField.text
        testDic["password"] = "password"
        testDic["email"] = "blsiege@suh.com"
        testDic["joined"] = "4/17/2016"
        
        firebaseRef?.childByAppendingPath("posts").setValue(testDic)
    }
}
