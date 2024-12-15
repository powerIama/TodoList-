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
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    let taskManager = TaskManager.shared
    
    @Published var tasks: [Todo] = []
    var anyCancellables: Set<AnyCancellable> = []

    var onTasksUpdated: (() -> Void)?
    
    func presentTaskView() {
        coordinator.presentTaskView { [weak self] in
            self?.fetchTasks()
        }
    }
    
    func fetchTasks() {
        let fetchedTasks = taskManager.fetchTasks()
        tasks = fetchedTasks
    }
    
    func deleteTask(lastTask task: Todo) {
        taskManager.coreData.deleteData(object: task)
        fetchTasks()
    }
    
    func binding() {
        $tasks
            .receive(on: DispatchQueue.main)
            .sink { _ in
                self.onTasksUpdated?()
        }
        .store(in: &anyCancellables)
        fetchTasks()
    }
}
