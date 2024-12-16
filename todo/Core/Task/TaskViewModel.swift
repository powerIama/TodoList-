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

    #warning("Bad naming, change to -> 'validateFields'")
    func checkingTextFields(title: String, description: String) -> Bool {
        return !title.isEmpty && !description.isEmpty
    }
    
    func createNewTask(title: String, description: String) {
        if let createdTask = taskManager.createTask(title: title, description: description) {
            print("Task created successfully: \(createdTask) ✅")
        } else {
            print("Failed to create task. ❌")
        }

        #warning("What if task wasn't created?")
        coordinator.onCreatedNewTask()

        print("Task Create Successfuly.")

        #warning("If you want to print logs after creating tasks than naming of this method is not proper, fetching means get data for presenting view. Remove this method and fetch logs directly in 'createNewTask' ")

        fetchTasks()
    }

    #warning("What is this code for?")
    func fetchTasks() {
        let tasks = taskManager.fetchTasks()
        print("🏎️ Fetched \(tasks.count) tasks: \(tasks)")
    }
}
