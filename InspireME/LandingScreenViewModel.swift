//
//  LandingScreenViewModel.swift
//  InspireME
//
//  Created by Brad Siegel on 4/24/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

class LandingScreenViewModel {
    
    var posts: [PostViewModel]
    
    init(posts: [PostViewModel]) {
        self.posts = posts
    }
}
