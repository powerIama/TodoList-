//
//  TaskManager.swift
//  todo
//
//  Created by Demian Basistyi on 12/14/24.
//

import UIKit
import CoreData

protocol TaskManagerProtocol {
    var coreDataManager: CoreDataManagerProtocol { get }
    
    func fetchTasks() -> [Todo]
    func createTask(title: String, description: String) throws -> Todo
    func fetchTasks(with name: String) -> Todo?
    func updateTask(task: Todo)
}

final class TaskManager: TaskManagerProtocol {
    
    static let shared = TaskManager()
    var coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchTasks() -> [Todo] {
        let fetchRequest = Todo.fetchRequest()
        do {
            return try coreDataManager.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func createTask(title: String, description: String) throws -> Todo {
        let context = (coreDataManager as! CoreDataManager).persistentContainer.viewContext
        let task = Todo(context: context)
        task.title = title
        task.taskDescription = description
        do {
            try context.save()
            return task
        } catch let createError {
            throw CoreDataError.creationFailed("Failed to create a task due to \(createError.localizedDescription).")
        }
    }
    
    func fetchTasks(with name: String) -> Todo? {
        let context = (coreDataManager as! CoreDataManager).persistentContainer.viewContext
        
        let fetchRequest = Todo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "title == %@", name)
        
        do {
            return try context.fetch(fetchRequest).first
        } catch {
            return nil
        }
    }
    
    func updateTask(task: Todo) {
        coreDataManager.saveData()
    }
}
