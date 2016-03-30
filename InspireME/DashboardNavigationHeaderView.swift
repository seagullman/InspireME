//
//  DashboardNavigationHeaderView.swift
//  InspireME
//
//  Created by Brad Siegel on 3/29/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class DashboardNavigationHeaderView: UIView {

    override func awakeFromNib() {
        self.backgroundColor = UIColor.redColor()
    }
    
    class func fromNib(frame: CGRect) -> DashboardNavigationHeaderView {
        let view = (NSBundle.mainBundle().loadNibNamed(
            "DashboardNavigationHeader",
            owner: nil,
            options: nil).first as? DashboardNavigationHeaderView)!
        view.frame = frame
        return view
    }
    
    @IBAction func addButtonTapped() {
        
    }
}
