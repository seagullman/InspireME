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
        var description: String
        switch code {
        case -5:
            description = ErrorDescription.InvalidEmail.rawValue
        case -6:
            description = ErrorDescription.IncorrectPassword.rawValue
        case -8:
            description = ErrorDescription.UserNotFound.rawValue
        case -9:
            description = ErrorDescription.EmailTaken.rawValue
        default:
            description = "Oops, something went wrong."
        }
        return description
    }
}

private enum ErrorDescription: String {
    case EmailTaken = "This email address is already registered to an account."
    case IncorrectPassword = "Invalid email/password."
    case InvalidEmail = "Please enter a valid email/password."
    case UserNotFound = "User not found."
}
