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
    
    func validateFields(title: String, description: String) -> Bool {
        return !title.isEmpty && !description.isEmpty
    }
    
    func createNewTask(title: String, description: String) {
        if let createdTask = try? taskManager.createTask(title: title, description: description) {
            print("Task created successfully: \(createdTask) ✅")
            coordinator.onCreatedNewTask()
        } else {
            print("Failed to create task. ❌")
        }
        let tasks = taskManager.fetchTasks()
        print("🏎️ Fetched \(tasks.count) tasks: \(tasks)")
    }
}
