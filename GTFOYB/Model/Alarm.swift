//
//  Alarm.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import Foundation
import SwiftData

@Model
class Alarm: Identifiable {
    var id = UUID()
    var name: String
    var time: Date
    var ringtone: String
    var isActive: Bool
    var days: [Days]
    var mission: WakeUpMission
    
    init(id: UUID = UUID(), name: String, time: Date, ringtone: String, isActive: Bool, days: [Days], mission: WakeUpMission) {
        self.id = id
        self.name = name
        self.time = time
        self.ringtone = ringtone
        self.isActive = isActive
        self.days = days
        self.mission = mission
    }
    
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        formatter.locale = Locale.current
        return formatter
    }
    
    var formattedTime: String {
        return formatter.string(from: time)
    }
}

//MARK: preview
extension Alarm {
    static let preview1 = Alarm(name: "Alarm", time: Calendar.current.date(from: DateComponents(year: 2025, month: 2, day: 23, hour: 8, minute: 30)) ?? Date(), ringtone: "ringtone1", isActive: true, days: [.monday, .tuesday, .wednesday, .thursday, .friday], mission: WakeUpMission.mathChallenge)
}
