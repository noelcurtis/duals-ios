//
//  DUSummaryViewController.swift
//  Duals
//
//  Created by ncurtis on 11/3/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var menuButton: UIBarButtonItem!
    var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var ladderSummaryArray: [LadderSummary] = []
    
    // an instance of the http client
    let dualsHttpClient = DualsHttpClient()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        populateUserLadders()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBar() {
        // setup the buttons
        menuButton = UIBarButtonItem(image: UIImage(named: "menuButton"), style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        addButton = UIBarButtonItem(image: UIImage(named: "addButton"), style: UIBarButtonItemStyle.Plain, target: self, action: "performCreateLadderSeague")
        
        // nav title image
        let navTitle = UIImage(named: "navTitle")
        let navTitleView = UIImageView(image: navTitle)
        self.navigationItem.titleView = navTitleView
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = menuButton
        self.navigationItem.rightBarButtonItem = addButton
        
        // make the nav bar translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.translucent = true
    }
    
    func performCreateLadderSeague() {
        self.performSegueWithIdentifier("summaryToCreateLadder", sender: self)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - UITableViewDatasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ladderSummaryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let summaryCell : SummaryCell = self.tableView.dequeueReusableCellWithIdentifier("summaryCell") as SummaryCell
        summaryCell.setupWithLadderSummary(self.ladderSummaryArray[indexPath.row])
        return summaryCell
    }
    
    func populateUserLadders() {
        dualsHttpClient.getAllLadders({(userLadders, error) -> Void in
            if let foundError = error{
                // show an error because something did not work
            } else {
                self.ladderSummaryArray = userLadders
                self.tableView.reloadData()
            }
        })
    }
}