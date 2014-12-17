//
//  DUSummaryViewController.swift
//  Duals
//
//  Created by ncurtis on 11/3/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var baseView: UIView!
    var menuButton: UIBarButtonItem!
    var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var ladderSummaryArray: [LadderSummary] = []
    var loadingView: LoadingView!
    
    // an instance of the http client
    let dualsHttpClient = DualsHttpClient()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingVew()
        setupNavBar()
        populateUserLadders()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupLoadingVew() {
        let bundle = NSBundle(forClass: self.dynamicType)
        var view = bundle.loadNibNamed("LoadingView", owner: nil, options: nil)[0] as LoadingView
        self.loadingView = view
        self.loadingView.hidden = true
        
        self.baseView.insertSubview(self.loadingView, atIndex: 3)
        
        // place the loading view
        self.loadingView.setTranslatesAutoresizingMaskIntoConstraints(false)
        // add the layout constraints to center the loading view in its parent view horizontially and vertically
        self.baseView.addConstraint(NSLayoutConstraint(item: self.loadingView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.baseView, attribute: NSLayoutAttribute.CenterX, multiplier: 0.75, constant: 0))
        self.baseView.addConstraint(NSLayoutConstraint(item: self.loadingView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.baseView, attribute: NSLayoutAttribute.CenterY, multiplier: 0.75, constant: 0))
    }
    
    func setupNavBar() {
        // setup the buttons
        menuButton = UIBarButtonItem(image: UIImage(named: "menuButton"), style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        addButton = UIBarButtonItem(image: UIImage(named: "addButton"), style: UIBarButtonItemStyle.Plain, target: self, action: "performCreateLadderSeague")
        
        // nav title image
        let navTitle = UIImage(named: "navTitle")
        let navTitleView = UIImageView(image: navTitle)
        self.navigationItem.titleView = navTitleView
        self.navigationItem.titleView?.hidden = true
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
        self.loadingView.hidden = false
        self.loadingView.startAnimating()
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        dualsHttpClient.getAllLadders({(userLadders, error) -> Void in
            if let foundError = error{
                // show an error because something did not work
            } else {
                self.ladderSummaryArray = userLadders
                
                self.tableView.reloadData()
                
                // show the buttons and hide the loading view
                self.loadingView.stopAnimating()
                self.loadingView.hidden = true
                self.navigationItem.leftBarButtonItem = self.menuButton
                self.navigationItem.rightBarButtonItem = self.addButton
                self.navigationItem.titleView?.hidden = false
            }
        })
    }
}