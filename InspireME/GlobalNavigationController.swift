//
//  GlobalNavigationController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit



class GlobalNavigationController: UINavigationController,
                                  UINavigationControllerDelegate {
    
    weak var navigationDelegate: UINavigationControllerDelegate? {
        didSet {
            self.delegate = self
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let destination = segue.destinationViewController as? RequiresViewModel {
//            if let viewModel = sender as? ViewModel, identifier = segue.identifier {
//                destination.setViewModel(viewModel)
//            }
//        }
    }
    
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        self.navigationDelegate?.navigationController?(navigationController, didShowViewController: viewController, animated: animated)
    }
    
    func navigationController(navigationController: UINavigationController,
                              willShowViewController viewController: UIViewController, animated: Bool) {
        self.navigationDelegate?.navigationController?(navigationController, willShowViewController: viewController, animated: animated)
    }

}
