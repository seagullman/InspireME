//
//  GlobalNavigationController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

enum Segue: String {
    case Register = "registration"
}
protocol SeguePerformer: class {
    func navigateWithSegue(segueToPerform: String, dataForSegue: AnyObject?)
}

protocol RequiresSeguePerformer: class {
    func setSeguePerformer(performer: SeguePerformer)
}

class GlobalNavigationController: UINavigationController,
                                  UINavigationControllerDelegate,
                                  SeguePerformer {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
    }
    
    func navigationController(navigationController: UINavigationController,
                              willShowViewController viewController: UIViewController,
                              animated: Bool) {
        
        if let destination = viewController as? RequiresSeguePerformer {
            destination.setSeguePerformer(self)
        }
    }
    
    func navigateWithSegue(segueToPerform: String, dataForSegue: AnyObject?) {
        dispatch_async(dispatch_get_main_queue(),{
                self.performSegueWithIdentifier(
                    segueToPerform,
                    sender: nil)
        })
    }
}
