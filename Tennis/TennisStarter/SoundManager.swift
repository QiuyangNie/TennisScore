//
//  SoundManager.swift
//  TennisStarter
//
//  Created by Qiuyang Nie on 21/04/2018.
//  Copyright © 2018 University of Chester. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager{
    
    private var audioPlayer:AVAudioPlayer?
    
    func playSound(){
        
        let soundFilename = "sound"
        
        //Get the path
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        
        guard bundlePath != nil else{
            
            print("No sound file found")
            return
            
        }
        
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        
        do{
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            audioPlayer?.play()
            
        }catch{
            
            print("Can not create auidoPlayer object")
            
        }
        
        
    }
    
    
}
