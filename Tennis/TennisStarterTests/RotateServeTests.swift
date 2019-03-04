//
//  RotateServeTests.swift
//  TennisStarterTests
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import XCTest

class RotateServeTests: XCTestCase {
    
    var rotateServe: RotateServe!
    
    override func setUp() {
        
        super.setUp()
        
        rotateServe = RotateServe()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testRotateServeInTieBreakFirst(){
        
        rotateServe.addNumbersOfTieBreakGame()
        
        XCTAssertTrue(rotateServe.rotateServe())
        
    }
    
    func testRotateServeInTieBreakAfterTheFirst(){
        
        rotateServe.addNumbersOfTieBreakGame()
        
        for _ in stride(from: 1, to: 10, by: 2){
            
            rotateServe.addNumbersOfTieBreakGame()
            rotateServe.addNumbersOfTieBreakGame()
            
        }
        
        XCTAssertTrue(rotateServe.rotateServe())
    }

}
