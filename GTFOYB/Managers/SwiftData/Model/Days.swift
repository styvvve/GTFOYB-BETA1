//
//  Days.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 27/02/2025.
//

import Foundation

enum Days: Int, Codable, CaseIterable, Comparable {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
    //methode de comparaison
    static func < (lhs: Days, rhs: Days) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
    
    var localizedName: String {
        switch self {
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturday:
            return "Saturday"
        case .sunday:
            return "Sunday"
        }
    }
    
    var shortName: String {
        switch self {
        case .monday:
            return "Mon"
        case .tuesday:
            return "Tue"
        case .wednesday:
            return "Wed"
        case .thursday:
            return "Thu"
        case .friday:
            return "Fri"
        case .saturday:
            return "Sat"
        case .sunday:
            return "Sun"
        }
    }
}
