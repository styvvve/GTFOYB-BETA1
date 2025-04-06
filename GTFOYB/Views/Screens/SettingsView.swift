//
//  SettingsView.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 07/04/2025.
//

import SwiftUI

struct SettingsView: View {
    
    let user: UserPreferences?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    CardView(user: user)
                    SettingsCard()
                    RestorePremiumPurchasesCard()
                }
                .padding(.vertical)
            }
            .navigationTitle(Text("Settings"))
        }
    }
}

#Preview {
    SettingsView(user: UserPreferences(name: "User1", darkMode: true))
}
