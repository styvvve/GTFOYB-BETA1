//
//  AlarmScrollView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 02/03/2025.
//

import SwiftUI
import SwiftData

struct AlarmScrollView: View {
    
    //une extension du viewModel
    @State private var viewModel: AlarmViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.alarms.isEmpty {
                    Text("Add a new alarm by clicking on the plus button")
                        .padding()
                        .italic()
                        .foregroundStyle(.gray)
                }else {
                    ForEach(viewModel.alarms) { alarm in
                        NavigationLink {
                            
                        }label: {
                            AlarmCell(alarm: alarm, modelContext: viewModel.modelContext)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle(Text("Alarms"))
            .toolbar {
                ToolbarItem {
                    Button {
                        
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    init(modelContext: ModelContext) {
        let viewModel = AlarmViewModel(modelContext: modelContext)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    do {
        let container = try ModelContainer(for: Alarm.self)
        let modelContext = container.mainContext
        return AlarmScrollView(modelContext: modelContext)
    }catch {
        return Text("Error")
    }
}
