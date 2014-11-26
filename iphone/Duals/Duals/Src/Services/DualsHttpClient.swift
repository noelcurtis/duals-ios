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
                
                let parsedUser : JSON = JSON(jsonUser)
                if let error:String = parsedUser["error"].string {
                    
                    println("Error signing up: \(error)")
                    let clientError = DualsHttpClientError(jsonError: parsedUser)
                    completionHandler(user: nil, error: clientError)
                    
                } else {
                    
                    println("Success signing up")
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
                
                let parsedUser: JSON = JSON(jsonUser)
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
    
    func createLadder(ladderParameters:[String: String], completionHandler:(ladderSummary: LadderSummary?, error: DualsHttpClientError?) -> Void) {
        Alamofire.request(Router.CreateLadder(ladderParameters)).responseJSON {
            (request, response, JSONLadderId, error) in
            
            if let jsonLadderId: AnyObject = JSONLadderId {
                
                let parsedLadderId: JSON = JSON(jsonLadderId)
                if let error:String = parsedLadderId["error"].string {
                    
                    println("Error authenticating: \(error)")
                    let clientError = DualsHttpClientError(jsonError: parsedLadderId)
                    completionHandler(ladderSummary: nil, error: clientError)
                    
                } else {

                    let ladderSummary = LadderSummary(ladderId: parsedLadderId["ladderId"].stringValue, name: ladderParameters["name"]!, activity: ladderParameters["activity"]!)
                    completionHandler(ladderSummary: ladderSummary, error: nil)
                    
                }
                
            } else {
                
                println("Error: \(error?.description)")
                completionHandler(ladderSummary: nil, error: DualsHttpClientError(message: "Could not complete request please try again.", code: 999))
                
            }
            
        }
    }
    
}