//
//  SetTests.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 01/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import XCTest

class SetTests: XCTestCase {
    
    var set:Set!
    
    override func setUp() {
        super.setUp()
        
        set = Set()
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
 
    func testAddOneSetScore(){
        
        set.addSetScoreToPlayer1()
        
        XCTAssertEqual(set.getPlayer1SetScore(), 1)
        
        set.addSetScoreToPlayer2()
        
        XCTAssertEqual(set.getPlayer2SetScore(), 1)
        
    }
    
    func testAddTwoSetScore(){
        
        set.addSetScoreToPlayer1()
        set.addSetScoreToPlayer1()
        
        XCTAssertEqual(set.getPlayer1SetScore(), 2)
        
        set.addSetScoreToPlayer2()
        set.addSetScoreToPlayer2()
        
        XCTAssertEqual(set.getPlayer2SetScore(), 2)
        
    }

    func testP1WinTheMatchEasy(){
        
        for _ in 0...2{
            
            set.addSetScoreToPlayer1()
            
        }

        XCTAssertTrue(set.player1WonTheMatch())
        
    }
    
    func testP2WinTheMatchEasy(){
        
        for _ in 0...2{
            
            set.addSetScoreToPlayer2()
            
        }
        
        XCTAssertTrue(set.player2WonTheMatch())
        
    }
    
    func testP1WinTheMatch(){
        
        for _ in 0...2{
            
            set.addSetScoreToPlayer1()
            
        }
        
        set.addSetScoreToPlayer2()
        
        
        
    }
    
    func testP1WinTheMatchInFifthSet(){
        
        for _ in 0...1{
            
            set.addSetScoreToPlayer1()
            set.addSetScoreToPlayer2()
            
        }
        
        set.addSetScoreToPlayer1()
        
        XCTAssertTrue(set.player1WonTheMatch())
        
    }
    
    func testP2WinTheMatchInFifthSet(){
        
        for _ in 0...1{
            
            set.addSetScoreToPlayer1()
            set.addSetScoreToPlayer2()
            
        }
        
        set.addSetScoreToPlayer2()
        
        XCTAssertTrue(set.player2WonTheMatch())
        
    }
    
    func testNoTieBreakInFifthSet(){
        
        set.addSetScoreToPlayer1()
        set.addSetScoreToPlayer1()
        set.addSetScoreToPlayer2()
        set.addSetScoreToPlayer2()
        
        XCTAssertTrue(set.noTieBreak())
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
