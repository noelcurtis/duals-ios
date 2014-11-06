//
//  DualsHttpClientTests.swift
//  Duals
//
//  Created by ncurtis on 11/6/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit
import XCTest
import Alamofire

class DualsHttpClientTests : XCTestCase {
    
    let dualsHttpClient = DualsHttpClient()
    
    override func setUp() {
        super.setUp()
        Router.baseURLString = "http://localhost:9000"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_SignUpUser_Success() {
        let userSignupParameters = ["email": "foo@bar.com", "password" : "foobar", "firstName": "foo", "lastName": "bar"]
        let expectation = expectationWithDescription("Sign up a user")
        
        dualsHttpClient.signUpUser(userSignupParameters, completionHandler:{
            (user, error) in
                expectation.fulfill()
                XCTAssertNotNil(user, "User should not be nil")
                XCTAssertNil(error, "error should be nil")
            }
        )
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func test_SignUpUser_Failure() {
        let userSignupParameters = ["email": "ar_asdfdf", "password" : "foobar", "firstName": "foo", "lastName": "bar"]
        let expectation = expectationWithDescription("Sign up a user")
        
        dualsHttpClient.signUpUser(userSignupParameters, completionHandler:{
            (user, error) in
            expectation.fulfill()
            XCTAssertNil(user, "User should be nil")
            XCTAssertNotNil(error, "error should not be nil")
            }
        )
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func test_AuthenticateUser_Success() {
        let userAuthParameters = ["email": "foo@bar.com", "password" : "foobar"]
        let expectation = expectationWithDescription("Authenticate user")
        
        dualsHttpClient.authenticateUser(userAuthParameters, completionHandler:{
            (user, error) in
                expectation.fulfill()
                XCTAssertNotNil(user, "User should not be nil")
                XCTAssertNil(error, "error should be nil")
        })
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
}
