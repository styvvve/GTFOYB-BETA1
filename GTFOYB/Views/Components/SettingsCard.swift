//
//  SettingsCard.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 07/04/2025.
//

import SwiftUI

struct SettingsCard: View {
    let cellColor: Color = Color(UIColor(red: 20 / 255, green: 19 / 255, blue: 19 / 255, alpha: 1))
        
        //ouverture des ecrans
        @State private var showThemeView = false
        @State private var showSystemConfigurationView = false
        @State private var showNotiveView = false
        @State private var showFAQView = false
        @State private var showFeedbackView = false
        @State private var showAboutview = false
        @State private var showRingtonesLibrary = false
        
        var body: some View {
            VStack {
                getTheView("Theme", $showThemeView)
                Divider()
                getTheView("System configuration", $showSystemConfigurationView)
                Divider()
                getTheView("Notice", $showNotiveView)
                Divider()
                getTheView("FAQ", $showFAQView)
                Divider()
                getTheView("Send feedback", $showFeedbackView)
                Divider()
                getTheView("About", $showAboutview)
            }
            .padding(20)
            .background(cellColor)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .padding(.horizontal, 10)
        }
        
        //MARK: Private components
        private func getTheView(_ text: String, _ navigateTo: Binding<Bool>) -> some View {
            Button {
                navigateTo.wrappedValue.toggle()
            }label: {
                HStack {
                    Text(text)
                        .foregroundStyle(.white)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.white)
                }
                .padding()
            }
        }
    }

#Preview {
    SettingsCard()
}
