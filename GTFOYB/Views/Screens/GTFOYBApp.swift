//
//  GTFOYBApp.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import SwiftUI
import SwiftData

@main
struct GTFOYBApp: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Alarm.self)
    }
    init() {
        do {
            container = try ModelContainer(for: Alarm.self)
        }catch {
            fatalError("Failed to initialize ModelContainer: \(error)")
        }
    }
}
