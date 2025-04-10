//
//  AlarmCell.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 28/02/2025.
//

import SwiftUI
import SwiftData

struct AlarmCell: View {
    
    @Bindable var alarm: Alarm //bindable donne un objet observable pour le swiftdata
    
    let cellColor = Color(UIColor(red: 20 / 255, green: 19 / 255, blue: 19 / 255, alpha: 1))
    
    //@Environment(\.modelContext) private var modelContext
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(alarm.name)
                .foregroundStyle(getFontsColor)
            HStack {
                Text(alarm.formattedTime)
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(getFontsColor)
                Spacer()
                Toggle("", isOn: $alarm.isActive)
                    .toggleStyle(SwitchToggleStyle(tint: .orange))
            }
            
            //afficher les jours selon les diff valeurs
            getDays
        }
        .padding(20)
        .background(cellColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    //MARK: Private components and subview
    private var getFontsColor: Color {
        alarm.isActive ? .white : .gray
    }
    
    private var getDays: some View {
        alarm.days = alarm.days.sorted()
        
        return HStack {
            if alarm.days.isEmpty {
                Text("Never")
                    .font(.system(size: 14))
                    .foregroundStyle(getFontsColor)
            }else if alarm.days.count == 7 {
                Text("Every day")
                    .font(.system(size: 14))
                    .foregroundStyle(getFontsColor)
            }else if alarm.days == [.monday, .tuesday, .wednesday, .thursday, .friday] {
                Text("Weekdays")
                    .font(.system(size: 14))
                    .foregroundStyle(getFontsColor)
            }else if alarm.days == [.saturday, .sunday] {
                Text("Weekends")
                    .font(.system(size: 14))
                    .foregroundStyle(getFontsColor)
            }else if alarm.days.count > 3 && alarm.days.count < 7 {
                Text(alarm.formattedShortDays)
                    .font(.system(size: 15))
                    .foregroundStyle(getFontsColor)
            }else if alarm.days.count == 1 {
                Text("Every \(alarm.formattedDays)")
                    .font(.system(size: 15))
                    .foregroundStyle(getFontsColor)
            } else {
                Text(alarm.formattedDays)
                    .font(.system(size: 14))
                    .foregroundStyle(getFontsColor)
            }
        }
    }
}

#Preview {
    AlarmCell(alarm: Alarm.preview1)
}
