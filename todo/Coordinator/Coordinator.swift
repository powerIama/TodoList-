//
//  Coordinator.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func start()
}
