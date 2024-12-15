//
//  TaskViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class TaskViewModel {
    
    var coordinator: TaskCoordinator
    init(coordinator: TaskCoordinator) {
        self.coordinator = coordinator
    }
    
    let taskManager = TaskManager.shared
    
    func checkingTextFields(title: String, description: String) -> Bool {
        return !title.isEmpty && !description.isEmpty
    }
    
    func createNewTask(title: String, description: String) {
        if let createdTask = taskManager.createTask(title: title, description: description) {
            print("Task created successfully: \(createdTask) ✅")
        } else {
            print("Failed to create task. ❌")
        }
        print("Task Create Successfuly.")
        fetchTasks()
    }
    
    func fetchTasks() {
        let tasks = taskManager.fetchTasks()
        print("🏎️ Fetched \(tasks.count) tasks: \(tasks)")
    }
}
