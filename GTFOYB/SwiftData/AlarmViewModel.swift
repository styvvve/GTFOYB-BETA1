//
//  AlarmViewModel.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation

class AlarmViewModel: ObservableObject {
    @Published var alarms: [Alarm] = []
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        alarms = dataSource.fetchAlarms()
    }
    
    //methodes
    func addAlarm(_ alarm: Alarm) {
        dataSource.addAlarm(alarm)
        alarms = dataSource.fetchAlarms()
        print("Les alarmes \(alarms)")
    }
    
    func deleteAlarm(_ alarm: Alarm) {
        dataSource.deleteAlarm(alarm)
        alarms = dataSource.fetchAlarms()
    }
    
    func saveContext() {
        dataSource.saveContext()
    }
    
    func fetchAlarms() {
        alarms = dataSource.fetchAlarms()
    }
}
