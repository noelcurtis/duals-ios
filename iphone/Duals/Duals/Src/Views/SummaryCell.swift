//
//  SummaryCell.swift
//  Duals
//
//  Created by ncurtis on 12/9/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class SummaryCell : UITableViewCell {
    
    @IBOutlet weak var ladderNameLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var scheduledMatchCountLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    
    func setupWithLadderSummary(ladderSummary: LadderSummary) {
        ladderNameLabel.text = ladderSummary.name
        activityLabel.text = ladderSummary.activity
        scheduledMatchCountLabel.text = "\(ladderSummary.scheduledMatches)"
        rankLabel.text = "\(ladderSummary.rank)"
        winsLabel.text = "\(ladderSummary.wins)"
    }
    
}

class SummaryNotificationCell : UITableViewCell {
    
    @IBOutlet weak var ladderNameLabel: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var scheduledMatchCountLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    func setupWithLadderSummary(ladderSummary: LadderSummary) {
        ladderNameLabel.text = ladderSummary.name
        activityLabel.text = ladderSummary.activity
        scheduledMatchCountLabel.text = "\(ladderSummary.scheduledMatches)"
        rankLabel.text = "\(ladderSummary.rank)"
        winsLabel.text = "\(ladderSummary.wins)"
    }
    
}
