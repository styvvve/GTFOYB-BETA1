//
//  User.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 04/03/2025.
//

import Foundation
import SwiftData

@Model
class User {
    var id = UUID()
    var name: String
    var ringtonesLibrary: [String]
    
    init(id: UUID = UUID(), name: String, ringtonesLibrary: [String]) {
        self.id = id
        self.name = name
        self.ringtonesLibrary = ringtonesLibrary
    }
}
