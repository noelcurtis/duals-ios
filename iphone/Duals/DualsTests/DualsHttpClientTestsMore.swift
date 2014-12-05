//
//  DualsHttpClientTestsMore.swift
//  Duals
//
//  Created by ncurtis on 12/4/14.
//  Copyright (c) 2014 noelcurtis. All rights reserved.
//

import UIKit
import XCTest
import Alamofire


class DualsHttpClientTestsMore : XCTestCase {
    
    let dualsHttpClient = DualsHttpClient()
    
    override func setUp() {
        super.setUp()
        Router.baseURLString = "http://localhost:9000"
        Router.OAuthToken = "e20a5954-e7da-4adf-8a78-5bfbab8103bf"
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_CreateLadder_Success() {
        let createLadderParameters = ["name" : "A test ladder", "activity" : "table tennis"]
        let expectation = expectationWithDescription("Create ladder for user")
        
        dualsHttpClient.createLadder(createLadderParameters, completionHandler:{
            (ladderSummary, error) in
            expectation.fulfill()
            XCTAssertNotNil(ladderSummary, "ladder summary should not be nil")
            XCTAssertNil(error, "error should be nil")
        })
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }
    
    func test_GetLadders_Success() {
        let expectation : XCTestExpectation = expectationWithDescription("Get ladders for user")
        
        dualsHttpClient.getAllLadders({
            (ladderSummaries, error) in
            expectation.fulfill()
            XCTAssertTrue(ladderSummaries.count > 0, "ladder summaries count should be greater than 0")
            XCTAssertNotNil(ladderSummaries[0].ladderId)
            XCTAssertNotNil(ladderSummaries[0].name)
            XCTAssertNotNil(ladderSummaries[0].activity)
            XCTAssertNil(error, "error should be nil")
        })
        
        waitForExpectationsWithTimeout(10) { (error) in
            XCTAssertNil(error, "\(error)")
        }
    }

}