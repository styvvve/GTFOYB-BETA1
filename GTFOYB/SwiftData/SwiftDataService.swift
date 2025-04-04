//
//  SwiftDataService.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation
import SwiftData

class SwiftDataService {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext
    
    @MainActor
    static let shared = SwiftDataService()
    
    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: Alarm.self, User.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        self.modelContext = modelContainer.mainContext
    }
    
    //charger les alarmes
    func fetchAlarms() -> [Alarm] {
        do {
            return try modelContext.fetch(FetchDescriptor<Alarm>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //ajouter une nouvelle alarme
    func addAlarm(_ alarm: Alarm) {
        modelContext.insert(alarm)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //sup alarme
    func deleteAlarm(_ alarm: Alarm) {
        modelContext.delete(alarm)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //MARK: Sauvegarder le contexte
    func saveContext() {
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //methodes pour user
    
    //recuperer l'utilisateur -> il y en a qu'un seul
    func fetchUser() -> User {
        do {
            return try modelContext.fetch(FetchDescriptor<User>()).first ?? User(name: "John", ringtonesLibrary: [])
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    //creer l'utilisateur
    func createUser(_ name: String) {
        let newUser = User(name: name, ringtonesLibrary: [])
        modelContext.insert(newUser)
        saveContext()
    }
}
