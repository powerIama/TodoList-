//
//  CoreDataManager.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import CoreData

protocol CoreDataManagerProtocol {
    var viewContext: NSManagedObjectContext { get }
    func saveData()
    func deleteData(object: NSManagedObject)
}

final class CoreDataManager: CoreDataManagerProtocol {
    
    static let shared = CoreDataManager()
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveData() {
        let context = viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved Error: \(nserror)")
            }
        }
    }
    func deleteData(object: NSManagedObject) {
        let context = viewContext
        context.delete(object)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete object: \(error.localizedDescription)")
        }
    }
}
