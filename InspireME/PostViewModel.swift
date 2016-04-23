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
    
    /*User ID referencing user who created the post */
    var userId: String {
        get {
            return post.userId ?? ""
        }
    }
    
    init(post: Post) {
        self.post = post
    }
}
