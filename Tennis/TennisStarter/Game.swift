import Foundation

class Game {
    
    private var player1Point = 0
    private var player2Point = 0
    
    
    init(){
        
    }
    
    /**Called to add a point to Player 1's score*/
    func addPointToPlayer1(){
        
        player1Point += 1
        
        //A:A -> 40:40
        if player1Point == player2Point && player1Point == 4{
            player1Point = 3
            player2Point = 3
            
        }
        
    }
    
    /**Called to add a point to Player 2's score*/
    func addPointToPlayer2(){
        
        player2Point += 1
        
        //A:A -> 40:40
        if player2Point == player1Point && player2Point == 4{
            player1Point = 3
            player2Point = 3
            
        }
        
    }
    
    /** Returns either 0, 15, 30, 40 or A, for games in progress, and an empty string if the game is over */
    func player1Score() -> String {
        
        var point = ""
        
        if player1Point == 1{
            point = "15"
        }else if player1Point == 2{
            point = "30"
        }else if player1Point == 3{
            point = "40"
        }else if player1Point == 4{
            point = "A"
        }else if player1Point == 0{
            point = "0"
        }
        
        return point
    }
    
    /** Returns either 0, 15, 30, 40 or A, for games in progress, and an empty string if the game is over */
    func player2Score() -> String {
        
        var point = ""
        
        if player2Point == 1{
            point = "15"
        }else if player2Point == 2{
            point = "30"
        }else if player2Point == 3{
            point = "40"
        }else if player2Point == 4{
            point = "A"
        }else if player2Point == 0{
            point = "0"
        }
        
        return point
    }
    
    /**Returns true if Player 1 has won this game*/
    func player1Won() -> Bool{
        
        var player1Won = false
        
        if player1Point == 4 && player2Point <= 2{
            
            player1Won = true
            
            player1Point = 0
            player2Point = 0
            
        }else if player1Point == 5 && player2Point == 3{
            
            player1Won = true
            
            player1Point = 0
            player2Point = 0
            
        }
        
        return player1Won
    }
    
    /**Returns true if Player 2 has won this game*/
    func player2Won() -> Bool{
        
        var player2Won = false
        
        if player2Point == 4 && player1Point <= 2{
            
            player2Won = true
            
            player1Point = 0
            player2Point = 0
            
        }else if player2Point == 5 && player1Point == 3{
            
            player2Won = true
            
            player1Point = 0
            player2Point = 0
            
        }
        
        return player2Won
    }
    
    /*Returns true if this game is over*/
    func complete() ->Bool {
        
        var gameComplete = false
        
        if player1Won() || player2Won(){
            
            gameComplete = true
            
        }else{
            gameComplete = false

            player1Point = 0
            player2Point = 0
        }
        
        return gameComplete
    }
    
    
    
    
    /**Returns the number of 'game points', if any, that player 1 has. A player has a 'game point' if they would win the game if the win the next point. How many game points they have depends on how many point their opponent would need to catch up with them*/
    func gamePointsForPlayer1() -> Int{
        //only needs implementing for the 'higher' tier of marks
        
        var gamePointsForPlayer1 = 0
        
        if player1Point == 3 && player2Point <= 2{
            
            gamePointsForPlayer1 = player1Point - player2Point
            
        }else if player1Point == 4 && player2Point == 3{
            
            gamePointsForPlayer1 = 1
            
        }else{
            
            gamePointsForPlayer1 = 0
            
        }

        return gamePointsForPlayer1
    }
    
    /**Returns the number of 'game points', if any, that player 2 has. A player has a 'game point' if they would win the game if the win the next point. How many game points they have depends on how many point their opponent would need to catch up with them*/
    func gamePointsForPlayer2() -> Int {
        //only needs implementing for the 'higher' tier of marks
        
        var gamePointsForPlayer2 = 0
        
        if player2Point == 3 && player1Point <= 2{
            
            gamePointsForPlayer2 = player2Point - player1Point
            
        }else if player2Point == 4 && player1Point == 3{
            
            gamePointsForPlayer2 = 1
            
        }else{
            
            gamePointsForPlayer2 = 0
            
        }
        
        return gamePointsForPlayer2

    }
    
}

