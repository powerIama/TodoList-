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
    
    func createNewTask(title: String, description: String, date: Date) {
        if let createdTask = try? taskManager.createTask(title: title, description: description, date: date) {
            print("Task created successfully: \(createdTask) ✅")
            coordinator.onCreatedNewTask()
        } else {
            print("Failed to create task. ❌")
        }
        let tasks = taskManager.fetchTasks(isComplete: false)
        let completedTask = taskManager.fetchTasks(isComplete: true)
        print("❌ Fetched \(tasks.count) tasks: \(tasks)")
        print("✅ Fetched \(completedTask.count) tasks: \(completedTask)")
    }
    
    func formatDateToMMDDYYYY(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: date)
    }

}


