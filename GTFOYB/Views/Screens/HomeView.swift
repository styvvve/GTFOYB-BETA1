//
//  ContentView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    @StateObject var alarmViewModel: AlarmViewModel = AlarmViewModel()
    
    var body: some View {
        TabView {
            Tab("Alarms", systemImage: "alarm.fill") {
                AlarmScrollView(alarmViewModel: alarmViewModel)
            }
            
            Tab("Sleep", systemImage: "moon.fill") {
                
            }
            
            Tab("Settings", systemImage: "gear") {
                
            }
        }
    }
}

#Preview {
    HomeView()
}
