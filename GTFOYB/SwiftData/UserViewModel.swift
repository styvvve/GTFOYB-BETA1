//
//  UserViewModel.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 05/03/2025.
//

import Foundation
import SwiftData

class UserViewModel: ObservableObject {
    @Published var user: User = User(name: "", ringtonesLibrary: [])
    
    private let dataSource: SwiftDataService
    
    init(dataSource: SwiftDataService) {
        self.dataSource = dataSource
        user = dataSource.fetchUser()
    }
}
