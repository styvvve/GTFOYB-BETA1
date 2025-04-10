//
//  AlarmScrollView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 02/03/2025.
//

import SwiftUI
import SwiftData

struct AlarmScrollView: View {
    
    @Environment(DependencyContainer.self) private var container
    @Environment(DataManager.self) private var dataManager
    @State var viewModel: AlarmViewModel
    
    //pour ouvrir ou fermer l'écran dans le sens inverse
    @State var addNewAlarmScreenIsPresenting = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.datas.isEmpty {
                    Text("Add a new alarm by clicking on the plus button")
                        .padding()
                        .italic()
                        .foregroundStyle(.gray)
                }else {
                    HStack {
                        Text("Next alarm in ")
                            .bold()
                        Spacer()
                    }
                    .padding()
                    ForEach(viewModel.datas) { alarm in
                        NavigationLink {
                            AddOrEditAlarm(editMode: true, alarm: alarm, addOrEditAlarmScreenIsPresenting: $addNewAlarmScreenIsPresenting)
                        }label: {
                            AlarmCell(alarm: alarm)
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

#Preview("Empty List") {
    AlarmScrollView(viewModel: AlarmViewModel(interactor: CoreInteractor(container: DevPreview.shared.container)))
        .previewEnvironment()
}

#Preview("Mock Data") {
    let viewModel = AlarmViewModel(interactor: MockAlarmInteractor())
    
    return AlarmScrollView(viewModel: viewModel)
        .previewEnvironment()
}
