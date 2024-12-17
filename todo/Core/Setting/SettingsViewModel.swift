//
//  SettingViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation
import UIKit

final class SettingsViewModel {

    var settingsPages: Array<SettingsItemConfiguration> = [
        .init(title: "Change Language".localized(), image: "🌎")
    ]
    
    var coodinator: SettingsCoordinator
    
    init(coodinator: SettingsCoordinator) {
        self.coodinator = coodinator
    }
    
    func presentSettingView() {
        coodinator.presentSettingView()
    }
}
