//
//  LadderDetailViewController.swift
//  Duals
//
//  Created by ncurtis on 12/27/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class LadderDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cancelButton: UIBarButtonItem!
    
    
    // an instance of the http client
    let dualsHttpClient = DualsHttpClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setupNavBar() {
        // setup the buttons
        cancelButton = UIBarButtonItem(image: UIImage(named: "cancelButton"), style: UIBarButtonItemStyle.Plain, target: self, action: "dismissView")
        
        // nav title image
        let navTitle = UIImage(named: "navTitle")
        let navTitleView = UIImageView(image: navTitle)
        self.navigationItem.titleView = navTitleView
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.leftBarButtonItem = cancelButton
        
        // make the nav bar translucent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.view.backgroundColor = UIColor.clearColor()
        self.navigationController?.navigationBar.translucent = true
    }
    
    func dismissView() {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
}
