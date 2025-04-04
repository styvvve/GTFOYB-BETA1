//
//  PickDatesView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 03/03/2025.
//

import SwiftUI

struct PickDatesView: View {
    
    @Binding var days: [Days]
    @State private var selectedDays: Set<Days> = []
    
    var body: some View {
        VStack {
            Form {
                ForEach(Days.allCases, id: \.self) { day in
                    Button {
                        if selectedDays.contains(day) {
                            selectedDays.remove(day)
                        }else {
                            selectedDays.insert(day)
                        }
                        
                        saveDays()
                    }label: {
                        HStack {
                            Image(systemName: "checkmark")
                                .opacity(selectedDays.contains(day) ? 1 : 0)
                            Text(day.localizedName)
                                .foregroundStyle(.white)
                        }
                    }
                }
            }
        }
        .onAppear {
            selectedDays = Set(days)
        }
    }
    
    private func saveDays() {
        days = Array(selectedDays).sorted()
    }
}

#Preview {
    PickDatesView(days: .constant([]))
}
