import UIKit
import CoreLocation
import EventKit


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var game = Game()
    var gameScore = GameScore()
    var tieBreak = TieBreak()
    var rotateServe = RotateServe()
    var callNewBalls = CallNewBalls()
    var set = Set()
    
    var soundManager = SoundManager()
    
    var locationManager = CLLocationManager()
    var locationService = LocationService()
    
    var addCaldendar = AddCalendarEvent()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        p1NameLabel.backgroundColor = UIColor.brown
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
    }
    
    @IBOutlet weak var p1NameLabel: UILabel!
    @IBOutlet weak var p2NameLabel: UILabel!
    
    @IBOutlet weak var p1PointsLabel: UILabel!
    @IBOutlet weak var p2PointsLabel: UILabel!
    
    @IBOutlet weak var p1GamesLabel: UILabel!
    @IBOutlet weak var p2GamesLabel: UILabel!
    
    @IBOutlet weak var p1SetsLabel: UILabel!
    @IBOutlet weak var p2SetsLabel: UILabel!
    
    @IBOutlet weak var p1PreviousSetsLabel: UILabel!
    @IBOutlet weak var p2PreviousSetsLabel: UILabel!
    
    @IBOutlet weak var NewBallsLabel: UILabel!
    
    @IBOutlet weak var pointsLabelPlayer1: UILabel!
    @IBOutlet weak var pointsLabelPlayer2: UILabel!
    
    
    @IBOutlet weak var LocationLabel: UILabel!
    
    @IBAction func p1AddPointPressed(_ sender: UIButton) {
        
        NewBallsLabel.text = ""
        
        // Is tiebreak or not
        // No tiebreak
        if !gameScore.isTieBreak(){
            
            
            addPointToPlayer1()
            
            //player1 and player2's game points, set points and match points
            getP1P2GameSetMatchPoint()
            
            
            
            // No tiebreak last set
        }else if set.noTieBreak(){
            
            addPointToPlayer1()
            
            
            gamePointsForLastSet()
            
            
            // Tiebreak
        }else{
            
            tieBreak.addPointToPlayer1TieB()
            rotateServe.addNumbersOfTieBreakGame()
            
            p1PointsLabel.text = String(tieBreak.getPointToPlayer1TieB())
            
            
            getP1P2breakPoints()
            
            
            if rotateServe.rotateServe(){
                
                changeServe()
                
            }
            
        }
        
        
        
        
        // if player1 won the game or not
        if game.player1Won(){
            
            gameScore.addGameScoreToPlayer1()
            callNewBalls.addNumberOfGames()
            
            p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
            
            p1PointsLabel.text = game.player1Score()
            p2PointsLabel.text = game.player2Score()
            
            changeServe()
            
            callNewBallsPlease()
            
        }
        
        
        
        //if player 1 won the set or not
        if gameScore.player1WonTheGame(){
            
            
            addSetScoreToPlayer1()
            
            gameScore.player1GameScoreClear()
            
            p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
            p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
            
        }
        
        //if player 1 won the tei-break or not
        if tieBreak.player1WonTheTieBreak(){
            
            gameScore.addGameScoreToPlayer1()
            callNewBalls.addNumberOfGames()
            
            addSetScoreToPlayer1()
            
            gameScore.clearGameScores()
            tieBreak.clearBreakPoints()
            
            p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
            p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
            
            p1PointsLabel.text = String(tieBreak.getPointToPlayer1TieB())
            p2PointsLabel.text = String(tieBreak.getPointToPlayer2TieB())
            
            callNewBallsPlease()
            
            
        }
        
        //if player1 won the match
        if set.player1WonTheMatch(){
            
            // create the alert
            winTheMatchAlert(message: "Player1 won the match.")
            
        }
        
    }
    
    
    
    
    
    @IBAction func p2AddPointPressed(_ sender: UIButton) {
        
        NewBallsLabel.text = ""
        
        // Is tiebreak or not
        if !gameScore.isTieBreak(){
            
            
            addPointToPlayer2()
            
            
            //player1 and player2's game points, set points and match points
            getP1P2GameSetMatchPoint()
            
            
            
        }else if set.noTieBreak(){
            
            
            addPointToPlayer2()
            
            
            gamePointsForLastSet()
            
            
            
            
            
        }else{
            
            tieBreak.addPointToPlayer2TieB()
            rotateServe.addNumbersOfTieBreakGame()
            
            p2PointsLabel.text = String(tieBreak.getPointToPlayer2TieB())
            
            
            
            getP1P2breakPoints()
            
            
            
            if rotateServe.rotateServe(){
                
                
                changeServe()
                
                
            }
            
            
            
        }
        
        
        
        if game.player2Won(){
            
            gameScore.addGameScoreToPlayer2()
            callNewBalls.addNumberOfGames()
            
            p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
            
            p1PointsLabel.text = game.player1Score()
            p2PointsLabel.text = game.player2Score()
            
            
            changeServe()
            
            callNewBallsPlease()
            
        }
        
        
        
        if gameScore.player2WonTheGame(){
            
            addSetScoreToPlayer2()
            
            gameScore.player2GameScoreClear()
            
            p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
            p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
        }
        
        if tieBreak.player2WonTheTieBreak(){
            
            gameScore.addGameScoreToPlayer2()
            callNewBalls.addNumberOfGames()
            
            addSetScoreToPlayer2()
            
            gameScore.clearGameScores()
            tieBreak.clearBreakPoints()
            
            p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
            p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
            
            p1PointsLabel.text = String(tieBreak.getPointToPlayer1TieB())
            p2PointsLabel.text = String(tieBreak.getPointToPlayer2TieB())
            
            callNewBallsPlease()
            
        }
        
        
        
        
        if set.player2WonTheMatch(){
            
            // create the alert
            winTheMatchAlert(message: "Player2 won the match.")
            
            
        }
        
    }
    
    
    @IBAction func reset(_ sender: Any) {
        
        p2NameLabel.backgroundColor = UIColor.clear
        p1NameLabel.backgroundColor = UIColor.brown
        
        
        if !game.complete(){
            
            p1PointsLabel.text = String(game.player1Score())
            p2PointsLabel.text = String(game.player2Score())
            
        }
        
        gameScore.clearGameScores()
        tieBreak.clearBreakPoints()
        
        callNewBalls.clearNumbersOfGames()
        NewBallsLabel.text = ""
        
        set.player1SetScoreClear()
        set.player2SetScoreClear()
        
        p1GamesLabel.text = String(gameScore.getPlayer1GameScore())
        p2GamesLabel.text = String(gameScore.getPlayer2GameScore())
        
        p1SetsLabel.text = String(set.getPlayer1SetScore())
        p2SetsLabel.text = String(set.getPlayer2SetScore())
        
        p1PreviousSetsLabel.text = ""
        p2PreviousSetsLabel.text = ""
        
        pointsLabelPlayer1.text = ""
        pointsLabelPlayer2.text = ""
        
        
    }
    
    
    //protocol method
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let lastLocation = locations.last!
        
        locationService.lookUpCurrentLocation(Location: lastLocation) { (location) in
            self.LocationLabel.text = location
        }
        
    }
    
    
    
    @IBAction func schedule(_ sender: Any) {
        
        if !addCaldendar.addToCalendar(){
            
            scheduleAlert(message:"Add to calendar")
            
        }else{
            
            scheduleAlert(message:"Fail to Add to calendar")
            
        }
        
    }
    
    
    
    func getP1P2GameSetMatchPoint(){
        
        
        if game.gamePointsForPlayer1() == 0{
            
            pointsLabelPlayer1.text = ""
            
        }else{
            
            
            if gameScore.player1hasSetPoints(){
                
                if set.player1hasMatchPoints(){
                    
                    pointsLabelPlayer1.text = "player1 has \(game.gamePointsForPlayer1()) match points"
                    
                }else{
                    
                    pointsLabelPlayer1.text = "player1 has \(game.gamePointsForPlayer1()) set points"
                    
                }
                
            }else{
                
                pointsLabelPlayer1.text = "player1 has \(game.gamePointsForPlayer1()) game points"
                
            }
            
        }
        
        
        if game.gamePointsForPlayer2() == 0{
            
            pointsLabelPlayer2.text = ""
            
        }else{
            
            
            if gameScore.player2hasSetPoints(){
                
                if set.player2hasMatchPoints(){
                    
                    pointsLabelPlayer2.text = "player2 has \(game.gamePointsForPlayer2()) match points"
                    
                }else{
                    
                    pointsLabelPlayer2.text = "player2 has \(game.gamePointsForPlayer2()) set points"
                    
                }
                
            }else{
                
                pointsLabelPlayer2.text = "player2 has \(game.gamePointsForPlayer2()) game points"
                
            }
            
        }
        
    }
    
    func gamePointsForLastSet(){
        
        if game.gamePointsForPlayer1() == 0{
            
            pointsLabelPlayer1.text = ""
            
        }else{
            
            pointsLabelPlayer1.text = "Player1 has \(game.gamePointsForPlayer1()) game points"
            
        }
        
        
        if game.gamePointsForPlayer2() == 0{
            
            pointsLabelPlayer2.text = ""
            
        }else{
            
            pointsLabelPlayer2.text = "Player2 has \(game.gamePointsForPlayer2()) game points"
            
        }
        
    }
    
    func getP1P2breakPoints(){
        
        if tieBreak.breakPointsForPlayer1() == 0{
            
            pointsLabelPlayer1.text = ""
            
        }else{
            
            
            if set.player1hasMatchPoints(){
                
                pointsLabelPlayer1.text = "Player1 has \(tieBreak.breakPointsForPlayer1()) match points"
                
            }else{
                
                pointsLabelPlayer1.text = "Player1 has \(tieBreak.breakPointsForPlayer1()) break points"
                
                
            }

            
        }
        
        
        if tieBreak.breakPointsForPlayer2() == 0{
            
            pointsLabelPlayer2.text = ""
            
        }else{
            
            
            if set.player2hasMatchPoints(){
                
                pointsLabelPlayer2.text = "Player2 has \(tieBreak.breakPointsForPlayer2()) match points"
                
            }else{
                
                pointsLabelPlayer2.text = "Player2 has \(tieBreak.breakPointsForPlayer2()) break points"
                
            }

            
        }
        
    }
    
    
    func winTheMatchAlert(message:String){
        
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: {action in
            
            self.p2NameLabel.backgroundColor = UIColor.clear
            self.p1NameLabel.backgroundColor = UIColor.brown
            
            self.set.player1SetScoreClear()
            self.set.player2SetScoreClear()
            
            self.callNewBalls.clearNumbersOfGames()
            self.NewBallsLabel.text = ""
            
            self.p1SetsLabel.text = String(self.set.getPlayer1SetScore())
            self.p2SetsLabel.text = String(self.set.getPlayer2SetScore())
            self.p1PreviousSetsLabel.text = ""
            self.p2PreviousSetsLabel.text = ""
            
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func scheduleAlert(message:String){
        
        // create the alert
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
        
        
    }
    
    func changeServe(){
        
        soundManager.playSound()
        
        if p1NameLabel.backgroundColor == UIColor.brown{
            
            p1NameLabel.backgroundColor = UIColor.clear
            p2NameLabel.backgroundColor = UIColor.brown
            
        }else if p1NameLabel.backgroundColor == UIColor.clear{
            
            p1NameLabel.backgroundColor = UIColor.brown
            p2NameLabel.backgroundColor = UIColor.clear
            
        }
        
        
    }
    
    func addPointToPlayer1(){
        
        game.addPointToPlayer1()
        p1PointsLabel.text = game.player1Score()
        p2PointsLabel.text = game.player2Score()
        
    }
    
    func addPointToPlayer2(){
        
        game.addPointToPlayer2()
        p1PointsLabel.text = game.player1Score()
        p2PointsLabel.text = game.player2Score()
        
    }
    
    func addSetScoreToPlayer1(){
        
        set.addSetScoreToPlayer1()
        p1SetsLabel.text = String(set.getPlayer1SetScore())
        p2SetsLabel.text = String(set.getPlayer2SetScore())
        
        p1PreviousSetsLabel.text?.append("\(String(gameScore.getPlayer1GameScore())) ")
        p2PreviousSetsLabel.text?.append("\(String(gameScore.getPlayer2GameScore())) ")
        
    }
    
    func addSetScoreToPlayer2(){
        
        set.addSetScoreToPlayer2()
        p2SetsLabel.text = String(set.getPlayer2SetScore())
        p1SetsLabel.text = String(set.getPlayer1SetScore())
        
        p1PreviousSetsLabel.text?.append("\(String(gameScore.getPlayer1GameScore())) ")
        p2PreviousSetsLabel.text?.append("\(String(gameScore.getPlayer2GameScore())) ")
        
    }
    
    
    func callNewBallsPlease(){
        
        if callNewBalls.callNewBalls(){
            
            NewBallsLabel.text = "New balls please"
            
        }
        
        
    }
    
    
}

