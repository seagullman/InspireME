//
//  GlobalNavigationController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase

class GlobalNavigationController: UINavigationController,
                                  UINavigationControllerDelegate {
    
    weak var navigationDelegate: UINavigationControllerDelegate? {
        didSet {
            self.delegate = self
        }
    }
    
    private let firebaseRef = Firebase()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //MARK: - Only necessary to do things here if GlobalContentController
        //needs something upon it's creation
        if let destination = sender?.destinationViewController as? RequiresFirebase {
            destination.setFirebase(firebaseRef)
        }
    }
    
    func navigationController(navigationController: UINavigationController,
                              didShowViewController viewController: UIViewController,
                              animated: Bool) {
        self.navigationDelegate?.navigationController?(
            navigationController,
            didShowViewController: viewController,
            animated: animated)
    }
    
    func navigationController(navigationController: UINavigationController,
                              willShowViewController viewController: UIViewController,
                              animated: Bool) {
        self.navigationDelegate?.navigationController?(
            navigationController,
            willShowViewController: viewController,
            animated: animated)
    }
}
