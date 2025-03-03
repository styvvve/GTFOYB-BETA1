//
//  AddOrEditAlarm.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 02/03/2025.
//

import SwiftUI
import SwiftData

//si on passe en mode edit = une alarme doit etre fournie
protocol alarmEditModeRequirement {
    
}

struct AddOrEditAlarm: View {
    
    //instance de viewModel
    @State private var viewModel: AlarmViewModel
    
    //definir si c'est en edit mode ou pas
    @Binding var editMode: Bool
    //recuperation de l'alarme si c'est le cas
    let alarm: Alarm?
    
    //les proprietes auquel on aura accès
    @State var id = UUID()
    @State var name: String = ""
    @State var time: Date = Date()
    @State var days: [Days] = []
    @State var isActive: Bool = true
    @State var ringtone: String = "ringtone1"
    @State var missions: WakeUpMission = .mathChallenge
    
    //fermer l'écran
    @Binding var addOrEditAlarmScreenIsPresenting: Bool
    
    //au cas ou on rencontre une erreur avec la sauvegarde
    @State private var didError = false
    
    //alerte pour avertir qu'il va sup l'alarme
    @State private var deleteAdvice = false
    
    var body: some View {
        NavigationView {
            VStack {
                DatePicker(
                    "Set up an alarm",
                    selection: $time,
                    displayedComponents: [.hourAndMinute]
                )
                .labelsHidden()
                .datePickerStyle(.wheel)
                
                Form {
                    Section(header: editMode ? Text("Change your alarm") : Text("Create a new alarm")) {
                        HStack {
                            Text("Name")
                            Spacer()
                            TextField("Alarm", text: $name)
                                .multilineTextAlignment(.trailing)
                        }
                        NavigationLink {
                            
                        }label: {
                            HStack {
                                Text("Repeat")
                                Spacer()
                                getTagFromDates()
                                    .foregroundStyle(.gray)
                            }
                        }
                        NavigationLink {
                            
                        }label: {
                            HStack {
                                Text("Ringtone")
                                Spacer()
                                Text(ringtone)
                                    .foregroundStyle(.gray)
                            }
                        }
                        Picker("Mission", selection: $missions) {
                            ForEach(WakeUpMission.allCases, id: \.self) { mission in
                                Text(mission.missionName)
                            }
                        }
                    }
                    if editMode {
                        HStack {
                            Spacer()
                            Button("delete") {
                                deleteAdvice.toggle()
                            }
                            .foregroundStyle(.red)
                            Spacer()
                        }
                    }
                }
            }
            .toolbar {
                if !editMode {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            addOrEditAlarmScreenIsPresenting.toggle()
                        }
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        if editMode {
                            viewModel.updateAlarm(alarm: alarm!, newName: name, newTime: time, newRingtone: ringtone, newIsActive: isActive, newDays: days, newMission: missions)
                        }else {
                            viewModel.addAlarm(name: name, time: time, ringtone: ringtone, isActive: isActive, days: days, mission: missions)
                        }
                    }
                }
            }
            .alert("Save failed", isPresented: $didError) {
                Button("OK", role: .cancel) {} //fait rien
            }message: {
                Text("Alarm save failed")
            }
            .alert(isPresented: $deleteAdvice) {
                Alert(
                    title: Text("Do you really want to delete this alarm ?"),
                    message: Text("No going back."),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.deleteAlarm(alarm: alarm!)
                    },
                    secondaryButton: .cancel()
                )
            }
            
            //recuperer les infos de l'alarme si c'est en mode edit
            .onAppear {
                if editMode {
                    if let alarm = alarm {
                        id = alarm.id
                        name = alarm.name
                        time = alarm.time
                        days = alarm.days
                        isActive = alarm.isActive
                        ringtone = alarm.ringtone
                        missions = alarm.mission
                    }
                }
            }
        }
    }
    
    
    //MARK: constructeur
    init(modelContext: ModelContext, editMode: Binding<Bool>, alarm: Alarm?, addOrEditAlarmScreenIsPresenting: Binding<Bool>) {
        _viewModel = State(initialValue: AlarmViewModel(modelContext: modelContext))
        self._editMode = editMode
        self.alarm = alarm
        self._addOrEditAlarmScreenIsPresenting = addOrEditAlarmScreenIsPresenting
    }
    
    //MARK: private methods
    private func getTagFromDates() -> Text {
        if days.isEmpty {
            return Text("Never")
        }else if days.count == 1 {
            return Text("Every \(String(describing: days.first!.localizedName))")
        }else if days == [.monday, .tuesday, .wednesday, .thursday, .friday] {
            return Text("Weekdays")
        }else if days == [.saturday, .sunday] {
            return Text("Weekends")
        }else if days.count > 1 && days.count <= 3 {
            let sentence = days.map { $0.shortName }.joined(separator: ", ")
            return Text(sentence)
        }else if days.count > 3 && days.count < 7 {
            let sentence = days.map { $0.shortName }.joined(separator: ", ")
            return Text(sentence).font(.system(size: 14))
        }else {
            return Text("Every day")
        }
    }
}

#Preview {
    if let container = try? ModelContainer(for: Alarm.self) {
        let modelContext = container.mainContext
        return AddOrEditAlarm(modelContext: modelContext, editMode: .constant(false), alarm: nil, addOrEditAlarmScreenIsPresenting: .constant(true))
    }else {
        return Text("error")
    }
}
