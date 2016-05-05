//
//  PostCell.swift
//  InspireME
//
//  Created by Brad Siegel on 5/4/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet private weak var quoteLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var postedByLabel: UILabel!
    @IBOutlet private weak var datePostedLabel: UILabel!
    
    func displayViewModel(viewModel: PostViewModel) {
        self.quoteLabel.text = viewModel.quote
        self.authorLabel.text = viewModel.author
        self.postedByLabel.text = viewModel.userName
        self.datePostedLabel.text = viewModel.datePosted
    }
}
