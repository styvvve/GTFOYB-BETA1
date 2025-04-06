//
//  AlarmScrollView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 02/03/2025.
//

import SwiftUI
import SwiftData

struct AlarmScrollView: View {
    
    @ObservedObject var alarmViewModel: AlarmViewModel
    
    //pour ouvrir ou fermer l'écran dans le sens inverse
    @State var addNewAlarmScreenIsPresenting = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if alarmViewModel.alarms.isEmpty {
                    Text("Add a new alarm by clicking on the plus button")
                        .padding()
                        .italic()
                        .foregroundStyle(.gray)
                }else {
                    ForEach(alarmViewModel.alarms) { alarm in
                        NavigationLink {
                            AddOrEditAlarm(editMode: true, alarm: alarm, addOrEditAlarmScreenIsPresenting: $addNewAlarmScreenIsPresenting)
                        }label: {
                            AlarmCell(alarmViewModel: alarmViewModel, alarm: alarm)
                        }
                    }
                }
            }
            .navigationTitle(Text("Alarms"))
            .fullScreenCover(isPresented: $addNewAlarmScreenIsPresenting) {
                AddOrEditAlarm(editMode: false, alarm: nil, addOrEditAlarmScreenIsPresenting: $addNewAlarmScreenIsPresenting)
            }
            .overlay(alignment: .bottomTrailing) {
                Button {
                    addNewAlarmScreenIsPresenting.toggle()
                }label: {
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                        
                        Image(systemName: "plus")
                            .foregroundStyle(.black)
                    }
                    .padding()
                }
            }
        }
    }
}

struct AlarmScrollView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmScrollView(alarmViewModel: MockAlarmViewModel())
    }
}
