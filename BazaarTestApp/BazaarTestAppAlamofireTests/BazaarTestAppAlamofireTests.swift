//
//  BazaarTestAppAlamofireTests.swift
//  BazaarTestAppAlamofireTests
//
//  Created by Tara Tandel on 4/23/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import XCTest
@testable import BazaarTestApp
class BazaarTestAppAlamofireTests: XCTestCase {
    var controllerUnderTest : MainViewController!
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        controllerUnderTest = nil

        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
