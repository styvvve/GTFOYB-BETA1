//
//  MockAlarmInteractor.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 09/04/2025.
//

import Foundation

//pour la preview
class MockAlarmInteractor: AlarmInteractor {
    
    private var dataStorage: [Alarm] = Alarm.mocks
    
    func fetchData() -> [Alarm] {
        return dataStorage
    }
    
    func create(data: Alarm) {
        dataStorage.append(data)
    }
    
    func delete(data: Alarm) {
        if let index = dataStorage.firstIndex(where: { $0.id == data.id }) {
            dataStorage.remove(at: index)
        }
    }
}

class MockLocalPersistance: LocalPersistance {
    
    private var mocks: [Alarm]
    
    init(mocks: [Alarm] = Alarm.mocks) {
        self.mocks = mocks
    }
    
    func getAll() -> [Alarm] {
        return mocks
    }
    
    func addData(model: Alarm) {
        mocks.append(model)
    }
    
    func updateData(model: Alarm) {
        guard let index = mocks.firstIndex(of: model) else { return }
        mocks[index] = model
    }
    
    func save() {
        
    }
    
    func deleteData(model: Alarm) {
        mocks.removeAll { $0.id == model.id }
    }
    
    func deleteAllData() {
        mocks.removeAll()
    }
}
