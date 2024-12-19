//
//  SettingCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = SettingsViewModel(
            coodinator: self
        )
        let viewController = SettingsViewController(viewModel: viewModel)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(
            viewController,
            animated: true
        )
    }
    
    func navigateToAppleSettings() {
        UIApplication.shared.open(
            URL.init(string: UIApplication.openSettingsURLString)!,
            options: [:],
            completionHandler: nil
        )
    }
}
