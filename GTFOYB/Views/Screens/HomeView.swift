//
//  ContentView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    
    //on prend des instances des deux viewModel
    @EnvironmentObject var alarmViewModel: AlarmViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        TabView {
            Tab("Alarms", systemImage: "alarm.fill") {
                AlarmScrollView()
            }
            
            Tab("Sleep", systemImage: "moon.fill") {
                
            }
            
            Tab("Settings", systemImage: "gear") {
                
            }
        }
    }
}

#Preview {
    let alarmViewModel = AlarmViewModel(dataSource: .shared)
    let userViewModel = UserViewModel(dataSource: .shared)
    HomeView()
        .environmentObject(alarmViewModel)
        .environmentObject(userViewModel)
}
