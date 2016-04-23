//
//  ErrorMapper.swift
//  InspireME
//
//  Created by Brad Siegel on 4/20/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation


extension NSError {

     func firebaseDescription() -> String {
        let emailTaken = "This email address is already registered to an account."
        let emptyPassword = "Password cannot be blank. Please enter a password."
        let invalidEmail = "Please enter a valid email address."
        
        var error: String
        switch code {
        case -5:
            error = emailTaken
        case -6:
            error = emptyPassword
        case -9:
            error = invalidEmail
        default:
            error = "Oops, something went wrong."
        }
        return error
    }
}
