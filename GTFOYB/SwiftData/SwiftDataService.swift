//
//  SwiftDataService.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation
import SwiftData

final class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    static let shared = SwiftDataService()
    
    private init() {
        self.modelContainer = try! ModelContainer(for: Alarm.self)
        self.modelContext = ModelContext(self.modelContainer)
    }
    
    //charger les alarmes
    @MainActor
    func fetchAlarms() throws -> [Alarm] {
        return try modelContext.fetch(FetchDescriptor<Alarm>())
    }
    
    //ajouter une nouvelle alarme
    @MainActor
    func addAlarm(_ alarm: Alarm) throws {
        modelContext.insert(alarm)
        try modelContext.save()
    }
    
    //sup alarme
    @MainActor
    func deleteAlarm(_ alarm: Alarm) throws {
        modelContext.delete(alarm)
        try modelContext.save()
    }
}
