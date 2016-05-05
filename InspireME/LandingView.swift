//
//  LandingView.swift
//  InspireME
//
//  Created by Brad Siegel on 5/1/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI

class LandingView: UIView {
    
    @IBOutlet private weak var tableView: UITableView!
    
    var firebaseRef = Firebase(
        url: NetworkFirebase.rootURL).childByAppendingPath(ChildPath.Posts.rawValue)
    
    var dataSource: FirebaseTableViewDataSource!
    
    override func awakeFromNib() {
        self.dataSource = FirebaseTableViewDataSource(
            query: firebaseRef,
            prototypeReuseIdentifier: "postcell",
            view: self.tableView)
    }
    
    func displayPosts() {
        self.dataSource.populateCellWithBlock { (cell, obj) -> Void in
            
            guard let cell = cell as? PostCell, snapshot = obj as? FDataSnapshot else { return }
            
            let viewModel = PostViewModel(post: Post(
                snapshot: snapshot))
            cell.displayViewModel(viewModel)
        }
        
        self.tableView.dataSource = self.dataSource
    }
}
