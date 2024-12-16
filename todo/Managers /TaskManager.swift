//
//  TaskManager.swift
//  todo
//
//  Created by Demian Basistyi on 12/14/24.
//

import UIKit
import CoreData

#warning("Please, separate managers into 2 separate files -> CoreDataManager, TaskManager")

#warning("Add finals to all classes which will not be inherited in future")

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
    #warning("Remove code below")
    // container
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
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
                fatalError("Unresolved Error: \(nserror)")
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
    
    static let shared = TaskManager()

    #warning("any word is not needed here")
    #warning("change naming to 'coreDataManager'")
    var coreData: any CoreDataManagerProtocol
    
    init(coreData: CoreDataManager = CoreDataManager()) {
        self.coreData = coreData
    }
    
    func fetchTasks() -> [Todo] {
        #warning("instead of doing this, add computed viewContext property to 'CoreDataManagerProtocol'")
        // let context = coreDataManager.viewContext
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext

        #warning("Use commented code instead of yours")
//        let fetchRequest = Todo.fetchRequest()
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")

        do {
            return try context.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    #warning("Instead of returning 'nil', you can make this method throwable")
    func createTask(title: String, description: String) -> Todo? {
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext
        let task = Todo(context: context)
        task.title = title
        task.taskDescription = description
        do {
            try context.save()
            return task
        } catch let createError {
            print("\(createError.localizedDescription)")
        }
        return nil
    }
    
    func fetchTasks(with name: String) -> Todo? {
        let context = (coreData as! CoreDataManager).persistentContainer.viewContext

        #warning("Use commented code instead of yours")
//        let fetchRequest = Todo.fetchRequest()
        let fetchRequest = NSFetchRequest<Todo>(entityName: "Todo")

        fetchRequest.predicate = NSPredicate(format: "title == %@", name)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            return nil
        }
    }
    
    func updateTask(task: Todo) {
        coreData.saveData()
    }
}
