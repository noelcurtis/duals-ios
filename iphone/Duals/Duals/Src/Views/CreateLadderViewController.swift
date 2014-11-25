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
    
    var cancelButton: UIBarButtonItem!
    var checkButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!

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
        checkButton = UIBarButtonItem(image: UIImage(named: "checkButton"), style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
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
            return self.tableView.dequeueReusableCellWithIdentifier("nameInputCell") as UITableViewCell
        } else {
            return self.tableView.dequeueReusableCellWithIdentifier("activityInputCell") as UITableViewCell
        }
    }
    

}
