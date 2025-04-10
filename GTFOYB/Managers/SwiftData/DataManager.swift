//
//  DataManager.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 09/04/2025.
//

import Foundation

@Observable
class DataManager {
    private let service: SwiftDataDataSource
    private let local: LocalPersistance

    /// it's like getAll(type: DataModel)
    var datas: [Alarm] = []

    init(
        service: SwiftDataDataSource = SwiftDataDataSource(),
        local: LocalPersistance = MockLocalPersistance()
    ) {
        self.service = service
        self.local = local
        loadData()
    }

    func loadData() {
        let localData = local.getAll()
        let serviceData = service.getAll(type: Alarm.self)
        #if MOCK
        datas = localData.isEmpty ? serviceData : localData
        print("Loaded mock data: \(datas.count) items")
        #else
        datas = serviceData
        #endif
    }

    func addData(data: Alarm) {
        #if MOCK
        local.addData(model: data)
        local.save()
        #else
        service.addData(model: data)
        service.save()
        #endif
        loadData()
    }
    
    func save() {
        service.save()
        loadData()
    }
    
    func updateData(data: Alarm) {
        #if MOCK
        local.updateData(model: data)
        local.save()
        #else
        service.updateData(model: data)
        service.save()
        #endif
        loadData()
    }
    
    func deleteData(data: Alarm) {
        service.deleteData(model: data)
        loadData()
    }
    
    func deleteAllData() {
        datas.removeAll()
        service.deleteAllData(type: Alarm.self)
    }
}
