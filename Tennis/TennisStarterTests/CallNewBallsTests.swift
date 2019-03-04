//
//  CallNewBallsTests.swift
//  TennisStarterTests
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import XCTest

class CallNewBallsTests: XCTestCase {
    
    var callNewBalls: CallNewBalls!
    
    override func setUp() {
        super.setUp()
        
        callNewBalls = CallNewBalls()
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
    
    
    
    func testCallNewBallsAfterFirst7Games(){
        
        for _ in 0...6{
            callNewBalls.addNumberOfGames()
        }
        
        XCTAssertTrue(callNewBalls.callNewBalls())
        
    }
    
    func testCallNewBallsAfterFirst7GamesAndThenAfterEvery9Games(){
        
        for _ in 0...6{
            
            callNewBalls.addNumberOfGames()
            
        }
        
        for _ in stride(from: 7, to: 1023, by: 9){
            
            for _ in 0...8{
                
                callNewBalls.addNumberOfGames()
                
            }
            
        }
        
        XCTAssertTrue(callNewBalls.callNewBalls())
        
    }
    
    func testCallNewBallsFirst7GamesP1andP2(){
        
        for _ in 0...2{
            
            callNewBalls.addNumberOfGames()
            callNewBalls.addNumberOfGames()
            
        }
        
        callNewBalls.addNumberOfGames()
        
        XCTAssertTrue(callNewBalls.callNewBalls())
        
        
    }
    
    
    // the numbers of game is even num and begins with 16
    func testCallNewBallsEvenNum(){
        
        for _ in 0...7{
            
            callNewBalls.addNumberOfGames()
            callNewBalls.addNumberOfGames()
            
        }
        
        for _ in stride(from: 16, to: 1023, by: 18){
            
            for _ in 0...8{
                
                callNewBalls.addNumberOfGames()
                callNewBalls.addNumberOfGames()
                
            }
            
        }
        
        XCTAssertTrue(callNewBalls.callNewBalls())
        
    }
    
    
    // the numbers of game is odd num and begins with 25
    func testCallNewBallsOddNum(){
        
        for _ in 0...11{
            
            callNewBalls.addNumberOfGames()
            callNewBalls.addNumberOfGames()
            
        }
        
        callNewBalls.addNumberOfGames()
        
        for _ in stride(from: 25, to: 1023, by: 18){
            
            for _ in 0...7{
                
                callNewBalls.addNumberOfGames()
                callNewBalls.addNumberOfGames()
                
            }
            
            callNewBalls.addNumberOfGames()
            callNewBalls.addNumberOfGames()
            
        }
        
        XCTAssertTrue(callNewBalls.callNewBalls())
        
    }
    
}
