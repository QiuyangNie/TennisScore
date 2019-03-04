//
//  GameScoreTests.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 30/04/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import XCTest

class GameScoreTests: XCTestCase {
    
    var gameScore: GameScore!
    
    override func setUp() {
        super.setUp()
        
        gameScore = GameScore()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testAddOneGameScore(){
        
        gameScore.addGameScoreToPlayer1()
        XCTAssertEqual(gameScore.getPlayer1GameScore(), 1)
        
        gameScore.addGameScoreToPlayer2()
        XCTAssertEqual(gameScore.getPlayer2GameScore(), 1)
        
    }
    
    func testSimpleWinSetP1(){
        
        for _ in 0...5{
            
            gameScore.addGameScoreToPlayer1()
            
        }

        XCTAssertTrue(gameScore.player1WonTheGame(), "player 1 win after 6 consecutive game score points")
       
    }
    
    func testSimpleWinSetP2(){
        
        for _ in 0...5{
            
            gameScore.addGameScoreToPlayer2()
            
        }
        
        XCTAssertTrue(gameScore.player2WonTheGame(), "player 2 win after 6 consecutive game score points")
        
    }
    
    
    func testP1WinTheSet(){
        
        for _ in 0...4{
            
            // 5 - 5
            gameScore.addGameScoreToPlayer1()
            gameScore.addGameScoreToPlayer2()
            
        }
        
            gameScore.addGameScoreToPlayer1() // 6 - 5
            gameScore.addGameScoreToPlayer1() // 7 - 5 win
        
            XCTAssertTrue(gameScore.player1WonTheGame(), "player 1 win (7 - 5)")
        
    }
    
    
    func testP2WinTheSet(){
        
        for _ in 0...4{
            
            // 5 - 5
            gameScore.addGameScoreToPlayer1()
            gameScore.addGameScoreToPlayer2()
            
        }
        
        gameScore.addGameScoreToPlayer2() // 6 - 5
        gameScore.addGameScoreToPlayer2() // 7 - 5 win
        
        XCTAssertTrue(gameScore.player2WonTheGame(), "player 2 win (7 - 5)")
        
    }
    

    func testTieBreak(){
        
        
        for _ in 0...5{
            
            gameScore.addGameScoreToPlayer1()
            gameScore.addGameScoreToPlayer2()
            
        }
        
        XCTAssertTrue(gameScore.isTieBreak())
  
    }
    

}
