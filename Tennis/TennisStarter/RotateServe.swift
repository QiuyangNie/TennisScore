//
//  RotateServe.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 05/05/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation

class RotateServe{
    
    private var numbersOfTieBreakGame = 0
    
    func addNumbersOfTieBreakGame(){
        
        numbersOfTieBreakGame += 1
        
    }
    
    func rotateServe() -> Bool{
        
        var rotateServe = false
        
        if numbersOfTieBreakGame % 2 == 0{
            
            rotateServe = false
            
        }else{
            
            rotateServe = true
        }
        
        return rotateServe
        
    }
    
    
}
