//
//  LadderSummary.swift
//  Duals
//
//  Created by ncurtis on 11/25/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation

// use to represent a ladder w.r.t a user
class LadderSummary {
    
    let ladderId: String
    let name: String
    let activity: String
    let scheduledMatches: Int = 0
    let numberOfWins: Int = 0
    
    init(ladderId: String, name: String, activity: String) {
        self.ladderId = ladderId
        self.name = name
        self.activity = activity
    }
    
}
