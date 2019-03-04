//
//  Set.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 17/04/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation


class Set{
    
    private var player1SetScore = 0
    private var player2SetScore = 0
    
    
    func addSetScoreToPlayer1(){
        player1SetScore += 1
    }
    
    
    func addSetScoreToPlayer2(){
        player2SetScore += 1
    }
    
    
    func getPlayer1SetScore() -> Int{
        
        return player1SetScore
        
    }
    
    
    func getPlayer2SetScore() -> Int{
        
        return player2SetScore
        
    }
    
    
    func player1WonTheMatch() -> Bool{
        
        var player1WonTheMatch = false
        
        if player1SetScore == 3 && player2SetScore <= 2{
            player1WonTheMatch = true
        }
        
        return player1WonTheMatch
        
    }
    
    func player1SetScoreClear(){
        player1SetScore = 0
    }
    
    func player2WonTheMatch() -> Bool{
        
        var player2WonTheMatch = false
        
        if player2SetScore == 3 && player1SetScore <= 2{
            player2WonTheMatch = true
        }
        
        return player2WonTheMatch
        
    }
    
    func player2SetScoreClear(){
        player2SetScore = 0
    }
    
        
    //last set no tie break
    func noTieBreak() -> Bool{
        
        var noTieBreak = false
        
        if player1SetScore == player2SetScore && player1SetScore == 2{
            
            noTieBreak = true
            
        }
        
        return noTieBreak
        
    }
    
    
    func player1hasMatchPoints() -> Bool{
        
        var player1hasMatchPoints = false
        
        if player1SetScore == 2 && player2SetScore <= 2{
            
            player1hasMatchPoints = true
            
        }
        
        return player1hasMatchPoints
        
    }
    
    
    func player2hasMatchPoints() -> Bool{
        
        var player2hasMatchPoints = false
        
        if player2SetScore == 2 && player1SetScore <= 2{
            
            player2hasMatchPoints = true
            
        }
        
        return player2hasMatchPoints
        
    }


}
