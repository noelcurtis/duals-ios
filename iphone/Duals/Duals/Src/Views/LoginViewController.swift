//
//  LoginViewController.swift
//  Duals
//
//  Created by ncurtis on 11/3/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var authErrorLabel: UILabel!
    
    // an instance of the http client
    let dualsHttpClient = DualsHttpClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailAddressTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // dispose of any resources that can be recreated.
    }
    
    func loginErrorAnimation() {
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.loginButton.transform = CGAffineTransformMakeTranslation(10, 0)
        }) { (finished) -> Void in
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.loginButton.transform = CGAffineTransformMakeTranslation(-10, 0)
            }, completion: { (finished) -> Void in
                UIView.animateWithDuration(0.1, animations: { () -> Void in
                    self.loginButton.transform = CGAffineTransformMakeTranslation(0, 0)
                    self.showErrors()
                })
            })
        }
    }

    @IBAction func loginButtonPressed(sender: AnyObject) {
        let userAuthParameters = ["email": emailAddressTextField.text, "password" : passwordTextField.text]
        println("Attempting login with \(userAuthParameters)")
        
        dualsHttpClient.authenticateUser(userAuthParameters, { (user, error) -> Void in
            if let foundUser = user {
                self.performSegueWithIdentifier("loginToSummaryScreen", sender: self)
            } else {
                self.loginErrorAnimation()
            }
        })
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        clearErrors()
    }
    
    func clearErrors() {
        self.authErrorLabel.hidden = true
        self.emailAddressTextField.textColor = UIColor.blackColor()
        self.passwordTextField.textColor = UIColor.blackColor()
    }
    
    func showErrors() {
        self.authErrorLabel.hidden = false
        self.emailAddressTextField.textColor = UIColor.redColor()
        self.passwordTextField.textColor = UIColor.redColor()
    }
}









