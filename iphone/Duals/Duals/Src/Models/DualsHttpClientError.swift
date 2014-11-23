//
//  DualsHttpClientError.swift
//  Duals
//
//  Created by ncurtis on 11/10/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation

class DualsHttpClientError {
    let message: String
    let code: Int
    
    init(jsonError: JSON) {
        self.message = jsonError["message"].stringValue
        if let errorCode: Int = jsonError["code"].int {
            self.code = errorCode
        } else {
            self.code = 0
        }
    }
    
    init(message: String, code: Int) {
        self.message = message
        self.code = code
    }
}
