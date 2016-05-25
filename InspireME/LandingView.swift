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

class LandingView: UIView{
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var firebaseRef = Firebase(
        url: NetworkFirebase.rootURL).childByAppendingPath(ChildPath.Posts.rawValue)
    
    var dataSource: FirebaseCollectionViewDataSource!
    
    override func awakeFromNib() {
        self.dataSource = FirebaseCollectionViewDataSource(
            query: firebaseRef,
            modelClass: nil, //TODO: see if I can put Post.self here to have it auto-map
            nibNamed: "PostCollectionViewCell",
            cellReuseIdentifier: "postCollectionViewCell",
            view: self.collectionView)
    }
    
    func displayPosts() {
        self.dataSource.populateCellWithBlock { (cell, obj) in
            guard let cell = cell as? PostCollectionViewCell, snapshot = obj as? FDataSnapshot else { return }
            let viewModel = PostViewModel(post: Post(
                snapshot: snapshot))
            cell.displayViewModel(viewModel)
        }
        
        self.collectionView.dataSource = self.dataSource
    }
}
