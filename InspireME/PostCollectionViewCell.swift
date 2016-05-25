//
//  PostCollectionViewCell.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    private let postedByText: String = "Posted by: "
    
    @IBOutlet private weak var quoteTextView: UITextView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var postedByLabel: UILabel!
    @IBOutlet private weak var datePostedLabel: UILabel!
    
    func displayViewModel(viewModel: PostViewModel) {
        self.quoteTextView.text = viewModel.quote
        self.authorLabel.text = viewModel.author
        self.postedByLabel.text = "\(postedByText)\(viewModel.userName)"
        self.datePostedLabel.text = viewModel.datePosted
    }
}
