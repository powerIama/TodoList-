//
//  CustomAlertCoordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import UIKit

class CustomAlertCoordinator: Coordinator {
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        DispatchQueue.main.async {
            let alertVC = CustomAlertView()
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.navigationController?.present(alertVC,animated: true)
        }
    }
}
