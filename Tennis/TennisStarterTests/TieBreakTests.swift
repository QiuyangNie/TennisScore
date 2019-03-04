//
//  TieBreakTests.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import XCTest

class TieBreakTests: XCTestCase {
    
    var tieBreak: TieBreak!
    
    override func setUp() {
        super.setUp()
        
        tieBreak = TieBreak()
        
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
    
    
    func testAddOneTieBreakPointToP1(){
        
        tieBreak.addPointToPlayer1TieB()
        
        XCTAssertEqual(tieBreak.getPointToPlayer1TieB(), 1)
        
    }
    
    func testAddOneTieBreakPointToP2(){
        
        tieBreak.addPointToPlayer2TieB()
        
        XCTAssertEqual(tieBreak.getPointToPlayer2TieB(), 1)
        
    }
    
    func testP1WinTheTieBreak(){
        
        for _ in 0...6{
            
            tieBreak.addPointToPlayer1TieB()
            
        }
        
        XCTAssertTrue(tieBreak.player1WonTheTieBreak(), "player 1 win after 7 consecutive points")
        
    }
    
    func testP2WinTheTieBreak(){
        
        for _ in 0...6{
            
            tieBreak.addPointToPlayer2TieB()
            
        }
        
        XCTAssertTrue(tieBreak.player2WonTheTieBreak(), "player 2 win after 7 consecutive points")
        
    }
    
    func testP1WinTheTieBreakWhenSixPointsAll(){
        
        for _ in 0...6{
            
            // 6 - 6
            tieBreak.addPointToPlayer1TieB()
            tieBreak.addPointToPlayer2TieB()
            
        }
        
        tieBreak.addPointToPlayer1TieB() // 7 - 6
        tieBreak.addPointToPlayer1TieB() // 8 - 6
        
        
        
        XCTAssertTrue(tieBreak.player1WonTheTieBreak())
        
    }
    
    func testP2WinTheTieBreakWhenSixPointsAll(){
        
        for _ in 0...6{
            
            // 6 - 6
            tieBreak.addPointToPlayer1TieB()
            tieBreak.addPointToPlayer2TieB()
            
        }
        
        tieBreak.addPointToPlayer2TieB() // 7 - 6
        tieBreak.addPointToPlayer2TieB() // 8 - 6
        
        
        XCTAssertTrue(tieBreak.player2WonTheTieBreak())
        
    }
    
}
