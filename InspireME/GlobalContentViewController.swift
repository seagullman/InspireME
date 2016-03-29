//
//  GlobalContentViewController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

protocol RequiresViewModel {
    func setViewModel(viewModel: ViewModel)
}

protocol SeguePerformer : class {
    func navigateWithSegue(segueToPerform: String, dataForSegue: AnyObject?)
}

protocol RequiresSeguePerformer : class {
    func setSeguePerformer(performer: SeguePerformer)
}

class GlobalContentViewController: UIViewController,
                                   UINavigationControllerDelegate,
                                   SeguePerformer {


    private weak var embeddedNavigationController : GlobalNavigationController?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MainContentEmbed",
            let destination = segue.destinationViewController as? GlobalNavigationController {
            self.embeddedNavigationController = destination
            destination.navigationDelegate = self
        }
    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if let destination = viewController as? RequiresSeguePerformer {
            destination.setSeguePerformer(self)
        }
    }
    
    func navigateWithSegue(segueToPerform: String, dataForSegue: AnyObject?) {
        dispatch_async(dispatch_get_main_queue(),{
            if let embeddedNavigationController = self.embeddedNavigationController {
                embeddedNavigationController.performSegueWithIdentifier(
                    segueToPerform,
                    sender: nil)
            }
        })
    }
}
