//
//  ErrorMapper.swift
//  InspireME
//
//  Created by Brad Siegel on 4/20/16.
//  Copyright © 2016 Brad Siegel. All rights reserved.
//

import Foundation

class ErrorMapper {
    
    private enum FirebaseError: String {
        case EmailTaken = "This email address is already registered to an account."
        case EmptyPassword = "Password cannot be blank. Please enter a password."
        case InvalidEmail = "Please enter a valid email address."
    }
    
    static func errorTextForCode(errorCode: String) -> String {
        var error: String
        switch errorCode {
        case "-5":
            error = FirebaseError.InvalidEmail.rawValue
        case "-6":
            error = FirebaseError.EmptyPassword.rawValue
        case "-9":
            error = FirebaseError.EmailTaken.rawValue
        default:
            error = "Oops, something went wrong."
        }
        return error
    }
}