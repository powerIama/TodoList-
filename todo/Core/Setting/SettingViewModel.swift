//
//  SettingViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import UIKit

class SettingViewModel {

    var settingsPages: Array<Settings> = [
        .init(title: "Change Language".localized(), image: "🌎")
    ]
    
    var coodinator: SettingCoordinator
    
    init(coodinator: SettingCoordinator) {
        self.coodinator = coodinator
    }
    
    func presentSettingView() {
        coodinator.presentSettingView()
    }
}
