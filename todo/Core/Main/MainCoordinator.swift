//
//  MainCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

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
        navigationController?.setViewControllers([vc], animated: true)
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
    
    func presentAlert(completion: @escaping (Result<(String, String), Error>) -> Void) {
        let alertController = UIAlertController(title: "Update Task", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "New Title"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "New Description"
        }
        
        let doneAction = UIAlertAction(title: "Update", style: .default) { _ in
            guard let firstText = alertController.textFields?[0].text, !firstText.isEmpty,
                  let secondText = alertController.textFields?[1].text, !secondText.isEmpty else {
                return
            }
            completion(.success((firstText, secondText)))
        }
        alertController.addAction(doneAction)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
