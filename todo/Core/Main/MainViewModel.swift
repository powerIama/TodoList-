//
//  MainViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit
import Combine

final class MainViewModel {
    
    var coordinator: MainCoordinator
    
    let taskManager = TaskManager.shared
    
    @Published var tasks: [Todo] = []
    @Published var completedTask: [Todo] = []
    
    var anyCancellables: Set<AnyCancellable> = []
    var onTasksUpdated: (() -> Void)?
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
        fetchTasks()
        binding()
    }
    
    func presentTaskView() {
        coordinator.presentTaskView { [weak self] in
            self?.fetchTasks()
        }
    }
    
    func navigateToSettings() {
        coordinator.navigateToSettings()
    }
    
    func fetchTasks() {
        tasks = taskManager.fetchTasks(isComplete: false)
        completedTask = taskManager.fetchTasks(isComplete: true)
    }
    
    func deleteTask(lastTask task: Todo) {
        taskManager.coreDataManager.deleteData(object: task)
        fetchTasks()
    }
    
    func markTaskAsComplete(with task: Todo) {
        taskManager.markAsComplete(with: task)
        fetchTasks()
    }
    
    func presentCustomAlert() {
        coordinator.presentCustomAlert()
    }
    
    func binding() {
        $tasks
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.onTasksUpdated?()
            }
            .store(in: &anyCancellables)
        $completedTask
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.onTasksUpdated?()
            }
            .store(in: &anyCancellables)
    }
}
