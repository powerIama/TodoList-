//
//  TaskViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import UIKit

final class TaskViewModel {
    var coordinator: TaskCoordinator
    
    init(coordinator: TaskCoordinator) {
        self.coordinator = coordinator
    }
    
    func checkingTextFields(title: String, description: String, completion: @escaping (Bool) -> Void) {
        guard !title.isEmpty, !description.isEmpty else {
            completion(false)
            return
        }
        completion(true)
    }
}
