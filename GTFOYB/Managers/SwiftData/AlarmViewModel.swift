//
//  AlarmViewModel.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation
import SwiftData

@MainActor
protocol AlarmInteractor {
    func fetchData() -> [Alarm]
    func create(data: Alarm)
    func delete(data: Alarm)
}

extension CoreInteractor: AlarmInteractor { }

@Observable
@MainActor
class AlarmViewModel {
    private let interactor : AlarmInteractor
    
    init(interactor: AlarmInteractor) {
        self.interactor = interactor
        loadData()
    }
    
    var datas: [Alarm] = []
    
    func loadData() {
        datas = interactor.fetchData()
    }
    
    func addNewAlarm(name: String, time: Date, ringtone: String, isActive: Bool, days: [Days], mission: WakeUpMission) {
        let newAlarm = Alarm(name: name, time: time, ringtone: ringtone, isActive: isActive, days: days, mission: mission)
        interactor.create(data: newAlarm)
        loadData()
    }
    
    func onDelete(_ data: Alarm) {
        interactor.delete(data: data)
        loadData()
    }
}
