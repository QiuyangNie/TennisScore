//
//  TieBreak.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation

class TieBreak{
    
    private var player1PointTieB = 0
    private var player2PointTieB = 0
    

    func addPointToPlayer1TieB(){
        
        player1PointTieB += 1

        
    }
    
    func addPointToPlayer2TieB(){
        
        player2PointTieB += 1

        
    }
    
    func getPointToPlayer1TieB() -> Int{
        
        return player1PointTieB
        
    }
    
    func getPointToPlayer2TieB() -> Int{
        
        return player2PointTieB
        
    }
    

    func player1WonTheTieBreak() -> Bool{
        
        var player1WonTheTieBreak = false
        
        if player1PointTieB == 7 && player2PointTieB <= 5{

            player1PointTieB = 0
            player2PointTieB = 0
            
            player1WonTheTieBreak = true
            
        }else if player1PointTieB - player2PointTieB == 2 && player1PointTieB >= 8{

            player1PointTieB = 0
            player2PointTieB = 0

            player1WonTheTieBreak = true
            
        }
        
        return player1WonTheTieBreak
        
    }
    
    func player2WonTheTieBreak() -> Bool{
        
        var player2WonTheTieBreak = false
        
        if player2PointTieB == 7 && player1PointTieB <= 5{

            player1PointTieB = 0
            player2PointTieB = 0

            player2WonTheTieBreak = true
            
        }else if player2PointTieB - player1PointTieB == 2 && player2PointTieB >= 8{

            player1PointTieB = 0
            player2PointTieB = 0

            player2WonTheTieBreak = true
            
        }
        
        return player2WonTheTieBreak
        
    }
    
    func clearBreakPoints(){
        
        player1PointTieB = 0
        player2PointTieB = 0

    }
    
    func breakPointsForPlayer1() -> Int{
        
        var breakPointsForPlayer1 = 0
        
        if player1PointTieB == 6 && player2PointTieB <= 5{
            
            breakPointsForPlayer1 = player1PointTieB - player2PointTieB
            
        }else if player1PointTieB - player2PointTieB == 1 && player1PointTieB >= 7{
            
            breakPointsForPlayer1 = player1PointTieB - player2PointTieB
            
        }
        
        return breakPointsForPlayer1
        
    }
    
    func breakPointsForPlayer2() -> Int{
        
        var breakPointsForPlayer2 = 0
        
        if player2PointTieB == 6 && player1PointTieB <= 5{
            
            breakPointsForPlayer2 = player2PointTieB - player1PointTieB
            
        }else if player2PointTieB - player1PointTieB == 1 && player2PointTieB >= 7{
            
            breakPointsForPlayer2 = player2PointTieB - player1PointTieB
            
        }
        
        return breakPointsForPlayer2
        
    }
    
    
}
