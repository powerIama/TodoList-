//
//  MainCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class MainCoordinator: Coordinator {
   
    weak var navigationController: UINavigationController?
    var childViewController: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vm = MainViewModel(coordinator: self)
        let vc = MainViewController(viewModel: vm)
        navigationController?.setViewControllers(
            [vc],
            animated: true
        )
    }
    
    func presentTaskView(_ onCreatedTask: @escaping () -> Void) {
        let coordinator = TaskCoordinator(navigationController: navigationController ?? UINavigationController(), onCreatedNewTask: {
            onCreatedTask()
        })
        childViewController.append(coordinator)
        coordinator.start()
    }
    
    func navigateToSettings() {
        let coordinator = SettingsCoordinator(navigationController: navigationController ?? UINavigationController())
        childViewController.append(coordinator)
        coordinator.start()
    }
    
    //Present Custom alert
    func presentCustomAlert() {
        let coordinator = CustomAlertCoordinator(navigationController: navigationController ?? UINavigationController())
        childViewController.append(coordinator)
        coordinator.start()
    }
}
