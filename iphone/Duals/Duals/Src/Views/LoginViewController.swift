//
//  LoginViewController.swift
//  Duals
//
//  Created by ncurtis on 11/3/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func preferredStatusBarStyle() -> UIStatusBarStyle {
//        return UIStatusBarStyle.LightContent
//    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        println("email: \(emailAddressTextField.text), password: \(passwordTextField.text)")
        // Perform segue
        self.performSegueWithIdentifier("loginToSummaryScreen", sender: self)
    }
}
