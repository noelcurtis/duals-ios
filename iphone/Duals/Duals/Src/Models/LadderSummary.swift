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
    let wins: Int = 0
    let rank: Int = -1
    let creator: Bool = false
    
    init(ladderId: String, name: String, activity: String, creator: Bool) {
        self.ladderId = ladderId
        self.name = name
        self.activity = activity
        self.creator = creator
    }
    
    init(jsonLadder: JSON) {
        self.ladderId = jsonLadder["ladderId"].stringValue
        self.name = jsonLadder["name"].stringValue
        self.activity = jsonLadder["activity"].stringValue

        self.scheduledMatches = jsonLadder["authToken"].intValue
        self.wins = jsonLadder["wins"].intValue
        self.rank = jsonLadder["rank"].intValue
        
        if let c = jsonLadder["creator"].bool {
            self.creator = c
        } else {
            self.creator = false
        }
    }
    
}
