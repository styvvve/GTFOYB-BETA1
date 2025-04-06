//
//  User.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 04/03/2025.
//

import Foundation

class UserPreferences: ObservableObject {
    @Published var name: String
    @Published var darkMode: Bool
    
    init(name: String, darkMode: String) {
        self.name = name
        self.darkMode = true
    }
}
