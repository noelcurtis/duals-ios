//
//  RouterTests.swift
//  Duals
//
//  Created by ncurtis on 11/5/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit
import XCTest
import Duals
import Alamofire

class RouterTests : XCTestCase {
    
    var userSignupParameters: [String: AnyObject]?
    var createLadderParameters: [String: AnyObject]?
    
    override func setUp() {
        super.setUp()
        Router.baseURLString = "http://localhost:9000"
        Router.OAuthToken = "1234"
        
        userSignupParameters = ["email": "foo@bar.com", "password" : "foobar", "firstName": "foo", "lastName": "bar"]
        createLadderParameters = ["name" : "test", "activity" : "test"]
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_RouterBaseUrl_CanChange_Success() {
        // This is an example of a functional test case.
        Router.baseURLString = "http://localhost1:9000"
        XCTAssertEqual("http://localhost1:9000", Router.baseURLString, "Base URL can be changed in Router")
    }
    
    func test_SignUp_Request_Success() {
        let urlRequestWrapper = Router.SignUp(userSignupParameters!)
        XCTAssertEqual(urlRequestWrapper.path, "/users", "Sign Up url is correct")
        XCTAssertEqual(urlRequestWrapper.method, Alamofire.Method.POST, "Sign Up method is correct")
    }
    
    func test_AuthenticateUser_Success() {
        let urlRequestWrapper = Router.AuthenticateUser(userSignupParameters!)
        XCTAssertEqual(urlRequestWrapper.path, "/users/authenticate", "Authenticate url is correct")
        XCTAssertEqual(urlRequestWrapper.method, Alamofire.Method.POST, "Authenticate method is correct")
    }
    
    func test_CreateLadder_Success() {
        let urlRequestWrapper = Router.CreateLadder(createLadderParameters!)
        XCTAssertEqual(urlRequestWrapper.path, "/ladders", "Authenticate url is correct")
        XCTAssertEqual(urlRequestWrapper.method, Alamofire.Method.POST, "Authenticate method is correct")
    }
    
    func test_GetAllLadders_Success() {
        let urlRequestWrapper = Router.GetAllLadders()
        XCTAssertEqual(urlRequestWrapper.path, "/ladders", "Authenticate url is correct")
        XCTAssertEqual(urlRequestWrapper.method, Alamofire.Method.GET, "Authenticate method is correct")
    }
}
