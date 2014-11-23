//
//  DualsHttpClient.swift
//  Duals
//
//  Created by ncurtis on 11/5/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation
import Alamofire

class DualsHttpClient {
    
    func signUpUser(signupParameters: [String: AnyObject], completionHandler: (user: User?, error: DualsHttpClientError?) -> Void) {
        Alamofire.request(Router.SignUp(signupParameters)).responseJSON {
            (request, response, JSONUser, error) in
            if let jsonUser: AnyObject = JSONUser {
                let parsedUser = JSON(jsonUser)
                // check for an error
                if let error:String = parsedUser["error"].string {
                    println("Error signing up: \(error)")
                    let clientError = DualsHttpClientError(jsonError: parsedUser)
                    completionHandler(user: nil, error: clientError)
                } else {
                    let user = User(jsonUser: parsedUser)
                    completionHandler(user: user, error: nil)
                }
            } else {
                println("Error: \(error?.description)")
                completionHandler(user: nil, error: DualsHttpClientError(message: "Could not complete request please try again.", code: 999))
            }
        }
    }
    
    func authenticateUser(authParameters:[String: AnyObject], completionHandler:(user: User?, error: DualsHttpClientError?) -> Void) {
        Alamofire.request(Router.AuthenticateUser(authParameters)).responseJSON {
            (request, response, JSONUser, error) in
            if let jsonUser: AnyObject = JSONUser {
                let parsedUser = JSON(jsonUser)
                // check for an error
                if let error:String = parsedUser["error"].string {
                    println("Error authenticating: \(error)")
                    let clientError = DualsHttpClientError(jsonError: parsedUser)
                    completionHandler(user: nil, error: clientError)
                } else {
                    let user = User(jsonUser: parsedUser)
                    Router.OAuthToken = user.authToken
                    println("Success authenticating: \(Router.OAuthToken)")
                    completionHandler(user: user, error: nil)
                }
            } else {
                println("Error: \(error?.description)")
                completionHandler(user: nil, error: DualsHttpClientError(message: "Could not complete request please try again.", code: 999))
            }
        }
    }
    
}