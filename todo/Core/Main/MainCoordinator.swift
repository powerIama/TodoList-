//
//  MainCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainCoordinator: Coordinator {
   
    var navigationController: UINavigationController
    var childViewController: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        navigationController.setViewControllers(
            [vc],
            animated: true
        )
    }
    
    func presentTaskView(_ onCreatedTask: @escaping () -> Void) {
        let coordinator = TaskCoordinator(navigationController: navigationController, onCreatedNewTask: {
            onCreatedTask() 
        })
        childViewController.append(coordinator)
        coordinator.start()
    }
    
    func presentSetttingView() {
        let coordinator = SettingsCoordinator(navigationController: navigationController)
        childViewController.append(coordinator)
        coordinator.start()
    }
}
