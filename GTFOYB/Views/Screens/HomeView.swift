//
//  ContentView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    
    var body: some View {
        TabView {
            Tab("Alarms", systemImage: "alarm.fill") {
                AlarmScrollView()
            }
            
            
            Tab("Settings", systemImage: "gear") {
                
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AlarmViewModel.previews) 
}
