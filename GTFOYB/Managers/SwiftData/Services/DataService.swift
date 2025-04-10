//
//  DataService.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 09/04/2025.
//

import Foundation

protocol DataService {
    func getAll() -> [Alarm]
    func addData(model: Alarm)
    func save()
    func updateData(model: Alarm)
    func deleteData(model: Alarm)
    func deleteAllData()
}
