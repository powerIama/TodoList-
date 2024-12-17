//
//  SettingCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import UIKit

class SettingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SettingViewModel(
            coodinator: self
        )
        
        let viewController = SettingViewController(viewModel: viewModel)
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(
            viewController,
            animated: true
        )
    }
}
