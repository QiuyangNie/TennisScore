//
//  GameScore.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 17/04/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation

class GameScore{
    
      private var player1GameScore = 0
      private var player2GameScore = 0

    
    func addGameScoreToPlayer1(){

        player1GameScore += 1


    }

    func addGameScoreToPlayer2(){

        player2GameScore += 1


    }

    func getPlayer1GameScore() -> Int{

        return player1GameScore

    }

    func getPlayer2GameScore() -> Int{

        return player2GameScore

    }
    
    
    func isTieBreak() -> Bool{
        
        var isTieBreak = false
        
        if player1GameScore == player2GameScore && player1GameScore == 6{
            
            isTieBreak = true
            
        }
        
        return isTieBreak
        
    }
    
    func player1WonTheGame() -> Bool{
        
        var player1WonTheGame = false
        
        if player1GameScore == 6 && player2GameScore <= 4{
            
            player1WonTheGame = true
            
        }else if player1GameScore - player2GameScore == 2 && player1GameScore >= 7{
            
            player1WonTheGame = true
            
        }
        
        return player1WonTheGame
        
    }
    
    func player2WonTheGame() -> Bool{
        
        var player2WonTheGame = false
        
        if player2GameScore == 6 && player1GameScore <= 4{
            
            player2WonTheGame = true
            
        }else if player2GameScore - player1GameScore == 2 && player2GameScore >= 7{
            
            player2WonTheGame = true
            
        }
        
        return player2WonTheGame
        
    }
    
    func player1GameScoreClear(){
        
        if player1WonTheGame(){
            player1GameScore = 0
            player2GameScore = 0
        }
        
    }
    
    func player2GameScoreClear(){
        
        if player2WonTheGame(){
            player1GameScore = 0
            player2GameScore = 0
        }
        
    }
    
    func clearGameScores(){
        player1GameScore = 0
        player2GameScore = 0
    
    }
        
    func player1hasSetPoints() -> Bool{
        
        var player1hasSetPoints = false
        
        if player1GameScore == 5 && player2GameScore < 5{
            
            player1hasSetPoints = true
            
        }else if player1GameScore - player2GameScore == 1 && player1GameScore >= 6{
            
            player1hasSetPoints = true
            
        }
        
        return player1hasSetPoints
        
    }
    
    func player2hasSetPoints() -> Bool{
        
        var player2hasSetPoints = false
        
        if player2GameScore == 5 && player1GameScore < 5{
            
            player2hasSetPoints = true
            
        }else if player2GameScore - player1GameScore == 1 && player2GameScore >= 6{
            
            player2hasSetPoints = true
            
        }
        
        return player2hasSetPoints
        
    }

}



