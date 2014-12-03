//
//  CreateLadderViewController.swift
//  Duals
//
//  Created by ncurtis on 11/24/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import Foundation
import UIKit

class CreateLadderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var cancelButton: UIBarButtonItem!
    var checkButton: UIBarButtonItem!
    var nameCell: CreateLadderNameCell!
    var activityCell: CreateLadderActivityCell!
    
    // an instance of the http client
    let dualsHttpClient = DualsHttpClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupNavBar() {
        // setup the buttons
        cancelButton = UIBarButtonItem(image: UIImage(named: "backButton"), style: UIBarButtonItemStyle.Plain, target: self, action: "dismissView")
        checkButton = UIBarButtonItem(image: UIImage(named: "checkButton"), style: UIBarButtonItemStyle.Plain, target: self, action: "createLadder")
        
        // nav title image
        let navTitle = UIImage(named: "navTitle")
        let navTitleView = UIImageView(image: navTitle)
        self.navigationItem.titleView = navTitleView
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = checkButton
        
        // make the nav bar translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.translucent = true
    }
    
    func dismissView() {
        self.dismissViewControllerAnimated(true, completion: {});
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    // MARK: - UITableViewDatasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            self.nameCell = self.tableView.dequeueReusableCellWithIdentifier("nameInputCell") as CreateLadderNameCell
            return self.nameCell
        } else {
            self.activityCell = self.tableView.dequeueReusableCellWithIdentifier("activityInputCell") as CreateLadderActivityCell
            return self.activityCell
        }
    }
    
    func createLadder() {
        let createLadderParameters = [
            "name" : self.nameCell.nameTextField.text!,
            "activity" : self.activityCell.activityTextField.text!
        ]
        
        if (createLadderParameters["name"] == nil) {
            // error name is empty
            self.nameCell.nameLabel!.textColor = UIColor.redColor()
            return;
        }
        
        if (createLadderParameters["activity"] == nil) {
            // error activity is empty
            self.activityCell.nameLabel!.textColor = UIColor.redColor()
            return;
        }
        
        
        dualsHttpClient.createLadder(createLadderParameters, completionHandler:{
            (ladderSummary, error) in
            
            if let summary = ladderSummary {
                println("Created ladder \(summary)")
                self.performSegueWithIdentifier("createLadderToLadderDetail", sender: summary)
            }
            
            if let e : DualsHttpClientError = error {
                // show the error message
                println("Error creating ladder \(e.message)")
            }
        })
    }
    

}
