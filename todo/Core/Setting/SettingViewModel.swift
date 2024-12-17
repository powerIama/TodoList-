//
//  SettingViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import UIKit

class SettingViewModel {

    var settingsPages: [Settings] = [
        .init(title: "Change Language", image: "🌎")
    ]
    
    var coodinator: SettingCoordinator
    
    init(coodinator: SettingCoordinator) {
        self.coodinator = coodinator
    }
}
