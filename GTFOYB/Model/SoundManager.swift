//
//  SoundManager.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 04/03/2025.
//

import Foundation
import AVFoundation

class SoundManager {
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    func playSound(named: String) {
        guard let url = Bundle.main.url(forResource: named, withExtension: "mp3") else { print("URL non trouvée"); return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            print("success")
        }catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
        player?.currentTime = 0 //reinitialiser la lecture du son
    }
    
    func isSoundPlaying() -> Bool {
        return player?.isPlaying ?? false
    }
}

//liste des noms des sonneries
let myRingtones = ["ringtone1", "ringtone2", "ringtone3", "ringtone4", "ringtone5"]
