//
//  SettingCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import UIKit

class SettingsCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SettingsViewModel(
            coodinator: self
        )
        
        let viewController = SettingsViewController(viewModel: viewModel)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
    
    func presentSettingView() {
        UIApplication.shared.open(
            URL.init(string: UIApplication.openSettingsURLString)!,
            options: [:],
            completionHandler: nil
        )
    }
}
