//
//  ContentView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @State var viewModel: AlarmViewModel
    
    var body: some View {
        TabView {
            Tab("Alarms", systemImage: "alarm.fill") {
                AlarmScrollView(viewModel: $viewModel)
            }
            
            
            Tab("Settings", systemImage: "gear") {
        
            }
        }
    }
}

#Preview("Empty List") {
    HomeView(viewModel: AlarmViewModel(interactor: CoreInteractor(container: DevPreview.shared.container)))
        .previewEnvironment()
}

#Preview("Mock Data") {
    let viewModel = AlarmViewModel(interactor: MockAlarmInteractor())
    
    return HomeView(viewModel: viewModel)
        .previewEnvironment()
}
