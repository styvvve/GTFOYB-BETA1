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
    
    @StateObject var alarmViewModel: AlarmViewModel = AlarmViewModel(dataSource: .shared)
    @StateObject var userViewModel: UserViewModel = UserViewModel(dataSource: .shared)
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(alarmViewModel)
                .environmentObject(userViewModel)
        }
    }
}
