//
//  CustomAlertCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import UIKit

final class CustomAlertCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel = CustomAlertViewModel()
        DispatchQueue.main.async {
            let alertVC = CustomAlertViewController(viewModel: viewModel)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.navigationController?.present(alertVC,animated: true)
        }
    }
}
