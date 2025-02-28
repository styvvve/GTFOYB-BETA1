//
//  WakeUpMission.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import Foundation

//enumeration de missions

enum WakeUpMission: String, CaseIterable, Codable {
    case mathChallenge = "mathChallenge"
    case shakePhone = "shakePhone"
    case typingChallenge = "typingChallenge"
    case memoryGame = "memoryGame"
    
    var missionName: String {
        switch self {
        case .mathChallenge:
            return "Simple addition"
        case .shakePhone:
            return "Shake your phone"
        case .typingChallenge:
            return "Typing challenge"
        case .memoryGame:
            return "Memory game"
        }
    }
}
