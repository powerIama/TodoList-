//
//  CustomAlertViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/20/24.
//

import Foundation


final class CustomAlertViewModel {
    
    func validateFields(title: String, description: String) -> Bool {
        return !title.isEmpty && !description.isEmpty
    }
    
    func updateTask(with task: Todo) {
        
    }
}
