//
//  DashboardController.swift
//  InspireME
//
//  Created by Brad Siegel on 3/28/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class DashboardController: UIViewController,
                           ProvidesCustomTitleView {

    //MARK: - ProvidesCustomTitleView
    func provideTitleView(frame: CGRect) -> UIView {
        return DashboardNavigationHeaderView.fromNib(frame)
    }
}
