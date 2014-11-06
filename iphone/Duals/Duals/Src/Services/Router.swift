//
//  Router.swift
//  Duals
//
//  Created by ncurtis on 11/5/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation
import Alamofire

enum Router : URLRequestConvertible {
    
    static var baseURLString = "http://localhost:9000"
    static var OAuthToken: String?
    
    case SignUp([String: AnyObject])
    case AuthenticateUser([String: AnyObject])
    
    var method: Alamofire.Method {
        switch self {
        case .SignUp:
            return .POST
        case .AuthenticateUser:
            return .POST
        }
    }
    
    var path: String {
        switch self {
        case .SignUp:
            return "/users"
        case .AuthenticateUser:
            return "/users/authenticate"
        }
    }
    
    // MARK: - URLRequestConvertible
    
    var URLRequest: NSURLRequest {
        let URL = NSURL(string: Router.baseURLString)
        let mutableURLRequest = NSMutableURLRequest(URL: URL!.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = Router.OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        switch self {
        case .SignUp(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        case .AuthenticateUser(let parameters):
            return Alamofire.ParameterEncoding.JSON.encode(mutableURLRequest, parameters: parameters).0
        default:
            return mutableURLRequest
        }
    }
    
}
