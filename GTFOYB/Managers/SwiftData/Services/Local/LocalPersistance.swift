//
//  LocalPersistance.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 09/04/2025.
//

import Foundation

protocol LocalPersistance {
    func getAll() -> [Alarm]
    func addData(model: Alarm)
    func save()
    func updateData(model: Alarm)
    func deleteData(model: Alarm)
    func deleteAllData()
}
