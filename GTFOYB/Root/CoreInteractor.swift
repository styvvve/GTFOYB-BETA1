//
//  CoreInteractor.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 10/04/2025.
//

import SwiftUI

@MainActor
struct CoreInteractor {
    
    private let dataManager: DataManager
    
    
    /// Initialise l'interactor avec un conteneur de dépendances.
    ///
    /// - Parameter container: Le conteneur de dépendances.
    init(container: DependencyContainer) {
        self.dataManager = container.resolve(DataManager.self)!
    }

    // MARK: DataManager

    /// Les données actuellement gérées par le gestionnaire de données.
    var datas: [Alarm] {
        dataManager.datas
    }

    /// Récupère les données actuellement gérées par le gestionnaire de données.
    ///
    /// - Returns: Une liste de modèles de données.
    func fetchData() -> [Alarm] {
        return dataManager.datas
    }

    /// Crée un nouveau modèle de données.
    ///
    /// - Parameter data: Le modèle de données à créer.
    func create(data: Alarm) {
        dataManager.addData(data: data)
    }

    /// Sauvegarde les données actuellement gérées par le gestionnaire de données.
    func save() {
        dataManager.save()
    }
    
    func update(data: Alarm) {
        dataManager.updateData(data: data)
    }

    /// Supprime un modèle de données.
    ///
    /// - Parameter data: Le modèle de données à supprimer.
    func delete(data: Alarm) {
        dataManager.deleteData(data: data)
    }

    /// Supprime toutes les données gérées par le gestionnaire de données.
    func deleteAllData() {
        dataManager.deleteAllData()
    }
}

