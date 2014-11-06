//
//  User.swift
//  Duals
//
//  Created by ncurtis on 11/9/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation

class User {

    var email: String
    var firstName: String
    var lastName: String
    var authToken: String
    // TODO(ncurtis): add in a update time here
    
    init(jsonUser: JSON) {
        self.email = jsonUser["email"].stringValue
        self.firstName = jsonUser["firstName"].stringValue
        self.lastName = jsonUser["lastName"].stringValue
        self.authToken = jsonUser["authToken"].stringValue
    }
    
}
