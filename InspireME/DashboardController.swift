//
//  DashboardController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/25/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class DashboardController: UIViewController,
                           RequiresViewModel,
                           RequiresSeguePerformer {
    
    private var viewModel : DashboardViewModel?
    private var seguePerformer: SeguePerformer?
    
    override func awakeFromNib() {
        print("DashboardController")
    }
    
    @IBAction private func login() {
        seguePerformer?.navigateWithSegue("landingSeg", dataForSegue: nil)
    }
    
    //MARK:- RequiresViewModel
    func setViewModel(viewModel: ViewModel) {
        if let viewModel = viewModel as? DashboardViewModel {
            self.viewModel = viewModel
        }
    }
    
    //MARK:- RequiresSeguePerformer
    func setSeguePerformer(performer: SeguePerformer) {
        self.seguePerformer = performer
    }
}
