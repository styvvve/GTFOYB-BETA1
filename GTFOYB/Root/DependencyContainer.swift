//
//  DependencyContainer.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 10/04/2025.
//

import SwiftUI

@Observable
@MainActor
class DependencyContainer {
    
    //dictionaire prive qui stocke les services enregistres
    private var services: [String: Any] = [:]
    
    //enregistre un service dans le conteneur
    func register<T>(_ type: T.Type, service: T) {
        let key = "\(type)"
        services[key] = service
    }
    
    //enregistre un service dans le conteneur en utilisant une fonction de création
    func register<T>(_ type: T.Type, service: () -> T) {
        let key = "\(type)"
        services[key] = service()
    }
    
    //résout un service enregitre dans le conteneur
    func resolve<T>(_ type: T.Type) -> T? {
        let key = "\(type)"
        return services[key] as? T
    }
}
