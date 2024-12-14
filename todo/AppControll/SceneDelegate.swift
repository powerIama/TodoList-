//
//  SceneDelegate.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController()
        let coordinator = MainCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        coordinator.start()
    }
}

