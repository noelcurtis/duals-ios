//
//  DUSummaryViewController.swift
//  Duals
//
//  Created by ncurtis on 11/3/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {
    
    var menuButton: UIBarButtonItem!
    var addButton: UIBarButtonItem!
 
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

}