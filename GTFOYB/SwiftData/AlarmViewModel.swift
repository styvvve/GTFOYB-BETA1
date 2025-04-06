//
//  AlarmViewModel.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation
import SwiftData

@MainActor
class AlarmViewModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService = .shared) {
        self.dataSource = dataSource
        loadAlarms()
    }
    
    //methodes
    func loadAlarms() {
        do {
            alarms = try dataSource.fetchAlarms()
        }catch {
            print("Erreur lors du chargement des alarmes : \(error.localizedDescription)")
        }
    }
    
    func addAlarm(name: String, time: Date, ringtone: String, isActive: Bool, days: [Days], mission: WakeUpMission) {
        let newAlarm = Alarm(name: name, time: time, ringtone: ringtone, isActive: isActive, days: days, mission: mission)
        do {
            try dataSource.addAlarm(newAlarm)
            loadAlarms()
        }catch {
            print("Erreur lors de l'enregistrement de l'alarme : \(error.localizedDescription)")
        }
    }
    
    func deleteAlarm(_ alarm: Alarm) {
        do {
            try dataSource.deleteAlarm(alarm)
            loadAlarms()
        } catch {
            print("Erreur lors de la suppression de l'alarme : \(error.localizedDescription)")
        }
    }
}


//une version pour la preview
final class MockAlarmViewModel: AlarmViewModel {
    override init(dataSource: SwiftDataService = .shared) {
        super.init(dataSource: dataSource)
        self.alarms = [
            Alarm(name: "test", time: Date(), ringtone: "ringtone1", isActive: true, days: [.friday, .monday], mission: .mathChallenge),
            Alarm(name: "test2", time: Date().addingTimeInterval(3600), ringtone: "ringtone2", isActive: false, days: [.monday, .tuesday, .wednesday], mission: .shakePhone)
            
        ]
    }
}
