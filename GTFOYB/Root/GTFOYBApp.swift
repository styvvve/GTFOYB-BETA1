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
    
    /// Le délégué de l'application UIKit, utilisé pour gérer les événements du cycle de vie de l'application.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            HomeView(viewModel: AlarmViewModel(interactor: CoreInteractor(container: delegate.dependencies.container)))
                .environment(delegate.dependencies.container)
                .environment(delegate.dependencies.dataManager)
        }
    }
}
