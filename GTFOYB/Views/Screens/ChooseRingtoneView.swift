//
//  ChooseRingtoneView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 04/03/2025.
//

import SwiftUI
import SwiftData

struct ChooseRingtoneView: View {
    
    @Binding var selectedRingtone: String
    
    //initialisation d'un tableau vide pour stocker les sonneries de l'utilisateur
    @State var userRingtones: [String] = []
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Default ringtones")) {
                    ForEach(myRingtones, id: \.self) { ringtone in
                        Button {
                            selectedRingtone = ringtone
                            SoundManager.instance.playSound(named: ringtone)
                        }label: {
                            HStack {
                                Image(systemName: "checkmark")
                                    .opacity(selectedRingtone == ringtone ? 1 : 0)
                                Text(ringtone)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
            }
        }
        .onDisappear {
            if SoundManager.instance.isSoundPlaying() {
                SoundManager.instance.stopSound()
            }
        }
    }
}

#Preview {
    ChooseRingtoneView(selectedRingtone: .constant("ringtone1"))
}
