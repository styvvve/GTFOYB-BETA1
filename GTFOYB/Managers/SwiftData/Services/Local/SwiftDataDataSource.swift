//
//  SwiftDataDataSource.swift
//  GTFOYB
//
//  Created by NGUELE Steve  on 09/04/2025.
//

import SwiftData

// classe de gestion des op de données à l'aide de SwiftData
class SwiftDataDataSource {
    
    //conteneur de modèle pour gérer les entités persistantes
    private var modelContainer: ModelContainer
    
    //contexte pour interagir avec la bd
    private lazy var modelContext: ModelContext = {
        return ModelContext(modelContainer)
    }()
    
    //init de la classe, configurant le conteneur de modèle
    init() {
        do {
            self.modelContainer = try ModelContainer(for: Alarm.self)
        } catch {
            fatalError("Erreur lors de l'initialisation du ModelContainer: \(error.localizedDescription)")
        }
    }
    
    //recupere ts les objets d'un type donné dps le conteneur de ce modele
    
    func getAll<T: PersistentModel>(type: T.Type) -> [T] {
        do {
            let fetchDecriptor = FetchDescriptor<T>(sortBy: [])
            return try modelContext.fetch(fetchDecriptor)
        } catch {
            print("Erreur lors de la récupération des données : \(error.localizedDescription)")
            return []
        }
    }
    
    //cree et insere un nouvel objet ds le conteneur de modele
    func addData<T: PersistentModel>(model: T) {
        modelContext.insert(model)
        save()
    }
    
    //sauvegarde les modifs ds le conteneur de model
    func save() {
        do {
            try modelContext.save()
        } catch {
            print("Erreur lors de la sauvegarde des modifications : \(error.localizedDescription)")
        }
    }
    
    //mettre a jour un objet
    func updateData<T: PersistentModel>(model: T) {
        save()
    }
    
    //supp un objet
    
    func deleteData<T: PersistentModel>(model: T) {
        modelContext.delete(model)
        save()
    }
    
    //supp toutes les donnees du conteneur
    func deleteAllData<T: PersistentModel>(type: T.Type) {
        let allData = getAll(type: type)
        for data in allData {
            modelContext.delete(data)
        }
        save()
    }
}
