//
//  TaskManager.swift
//  todo
//
//  Created by Demian Basistyi on 12/14/24.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func saveData()
    func deleteData(object: NSManagedObject)
}

protocol TaskManagerProtocol {
    var coreData: CoreDataManagerProtocol { get }
    
    func fetchTasks() -> [Todo]
    func createTask(title: String, description: String) -> Todo?
    func fetchTasks(with name: String) -> Todo?
    func updateTask(task: Todo)
}

class CoreDataManager: CoreDataManagerProtocol {
    // container
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "AppTaskModel")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error {
                fatalError("Loading of store failed \(error)")
            }
        }
        return container
    }()
    
    func saveData() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved Error")
            }
        }
    }
    func deleteData(object: NSManagedObject) {
        let context = persistentContainer.viewContext
        context.delete(object)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete object: \(error.localizedDescription)")
        }
    }
}

class TaskManager: TaskManagerProtocol {
    
    var coreData: any CoreDataManagerProtocol
    
    init(coreData: CoreDataManager) {
        self.coreData = coreData
    }
    
    func fetchTasks() -> [Todo] {
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")
        do {
            return try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch data :(")
            return []
        }
    }
    
    func createTask(title: String, description: String) -> Todo? {
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Todo", in: context) else { return nil }
        let newTask = Todo(entity: entity, insertInto: context)
        newTask.title = title
        newTask.taskDescription = description
        coreData.saveData()
        return newTask
    }
    
    func fetchTasks(with name: String) -> Todo? {
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")
        fetchRequest.predicate = NSPredicate(format: "title == %@", name)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            print("Failed to fetch task with name \(name): \(error.localizedDescription)")
            return nil
        }
    }
    
    func updateTask(task: Todo) {
        coreData.saveData()
    }
}
