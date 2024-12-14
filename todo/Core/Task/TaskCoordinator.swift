//
//  TaskCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class TaskCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = TaskViewModel(coordinator: self)
        let vc = TaskViewController(viewModel: vm)
        navigationController.present(
            vc,
            animated: true
        )
    }
}
