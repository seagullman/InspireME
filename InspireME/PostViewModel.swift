//
//  PostViewModel.swift
//  InspireME
//
//  Created by Brad Siegel on 4/13/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

class PostViewModel {
    
    private let post: Post
    
    var author: String {
        get {
            //TODO: - add format functions to handle nil cases
            return post.author ?? ""
        }
    }
    
    var datePosted: String {
        get {
            return ""
        }
    }
    
    var quote: String {
        get {
            //TODO: - add format functions to handle nil cases
            return post.quote ?? ""
        }
    }
    
    init(post: Post) {
        self.post = post
    }
}

class PostsViewModel: NSObject, ViewModel {

    var posts = [PostViewModel]() //TODO: would prefer not to initialize this up here
    
    init(posts: [Post]) {
        super.init()
        convertToViewModels(posts)
    }
    
    private func convertToViewModels(posts: [Post]) {
        for post in posts {
            self.posts.append(PostViewModel(post: post))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
    }
}
