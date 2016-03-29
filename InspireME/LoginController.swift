//
//  LoginController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class LoginController: UIViewController,
                       RequiresSeguePerformer {
    
    private var seguePerformer: SeguePerformer?
    
    @IBAction private func login() {
        seguePerformer?.navigateWithSegue("landingSeg", dataForSegue: nil)
    }
    
    //MARK:- RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
}
