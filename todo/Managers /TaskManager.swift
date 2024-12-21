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
    
    func fetchTasks(isComplete: Bool) -> [Todo]
    func createTask(title: String, description: String, date: String, isComplete: Bool) throws -> Todo
    func fetchTasks(with name: String) -> Todo?
    func updateTask(task: Todo)
}

final class TaskManager: TaskManagerProtocol {
    
    static let shared = TaskManager()
    var coreDataManager: CoreDataManagerProtocol
    
    init(coreDataManager: CoreDataManagerProtocol = CoreDataManager.shared) {
        self.coreDataManager = coreDataManager
    }
    
    func fetchTasks(isComplete: Bool) -> [Todo] {
        let fetchRequest = Todo.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: isComplete))
        
        do {
            return try coreDataManager.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }

    
    func createTask(title: String, description: String, date: String, isComplete: Bool = false) throws -> Todo {
        let context = (coreDataManager as! CoreDataManager).persistentContainer.viewContext
        let task = Todo(context: context)
        task.title = title
        task.taskDescription = description
        task.date = date
        task.isComplete = isComplete
        do {
            try context.save()
            return task
        } catch let createError {
            throw CoreDataError.creationFailed("Failed to create a task due to \(createError.localizedDescription).")
        }
    }
    
    func markAsComplete(with task: Todo) {
        task.isComplete = true
        coreDataManager.saveData()
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
