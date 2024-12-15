//
//  TaskCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class TaskCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var onCreatedNewTask: () -> Void
    
    init(
        navigationController: UINavigationController,
        onCreatedNewTask: @escaping () -> Void
    ) {
        self.navigationController = navigationController
        self.onCreatedNewTask = onCreatedNewTask
    }
    
    func start() {
        let vm = TaskViewModel(coordinator: self)
        let vc = TaskViewController(viewModel: vm)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.present(
            vc,
            animated: true
        )
    }
}
