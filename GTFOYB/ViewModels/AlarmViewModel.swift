//
//  AlarmViewModel.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class AlarmViewModel {
    var modelContext: ModelContext //contexte pour interagir avec swiftData
    
    var alarms: [Alarm] = []
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        fetchAlarms() //charge les alarmes au lancement
    }
    
    //methodes pour charger toutes les alarmes enregistrées
    func fetchAlarms() {
        let descriptor = FetchDescriptor<Alarm>(sortBy: [SortDescriptor(\.time)])
        alarms = (try? modelContext.fetch(descriptor)) ?? []
    }
    
    //ajouter une alarme
    func addAlarm(name: String, time: Date, ringtone: String, isActive: Bool, days: [Days], mission: WakeUpMission) {
        let alarm = Alarm(name: name, time: time, ringtone: ringtone, isActive: isActive, days: days, mission: mission)
        modelContext.insert(alarm)
        fetchAlarms() //recuperer toutes les alarmes
    }
    
    //modifier une alarme
    func updateAlarm(alarm: Alarm, newName: String, newTime: Date, newRingtone: String, newIsActive: Bool, newDays: [Days], newMission: WakeUpMission) {
        alarm.name = newName
        alarm.time = newTime
        alarm.ringtone = newRingtone
        alarm.isActive = newIsActive
        alarm.days = newDays
        alarm.mission = newMission
        fetchAlarms()
    }
    
    //sup une alarme
    func deleteAlarm(alarm: Alarm) {
        modelContext.delete(alarm)
        fetchAlarms()
    }
}
