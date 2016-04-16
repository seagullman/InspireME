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
                          RequiresFirebase {

    
    private var firebaseRef: Firebase?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setFirebase(firebaseRef: Firebase) {
        self.firebaseRef = firebaseRef
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
