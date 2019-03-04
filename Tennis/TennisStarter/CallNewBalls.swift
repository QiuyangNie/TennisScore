//
//  CallNewBalls.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation

class CallNewBalls{
    
    
    private var numbersOfGames = 0
    
    
    func addNumberOfGames(){
        
        numbersOfGames += 1
        
    }
    
    func callNewBalls() -> Bool{
        
        var callNewBalls = false
        
        if numbersOfGames == 7{
            
            callNewBalls = true
            
        }else if numbersOfGames % 9 == 7{
            
            callNewBalls = true
            
        }
        
        return callNewBalls
        
    }
    
    func clearNumbersOfGames(){
        
        numbersOfGames = 0
        
    }
    
    
}
