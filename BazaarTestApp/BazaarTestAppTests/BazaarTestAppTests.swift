//
//  BazaarTestAppTests.swift
//  BazaarTestAppTests
//
//  Created by Tara Tandel on 4/17/1397 AP.
//  Copyright © 1397 Tara Tandel. All rights reserved.
//

import XCTest
@testable import BazaarTestApp

class BazaarTestAppTests: XCTestCase {
    
    var appUnderTest : Movie!

    override func setUp() {
        super.setUp()
        
        appUnderTest = Movie()
//        appUnderTest.buildList()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        appUnderTest = nil
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
