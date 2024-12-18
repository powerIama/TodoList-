//
//  SettingViewModel.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation

final class SettingsViewModel {

    var settingsPages: Array<SettingsItemConfiguration> = [
        .init(title: "settings.change_language".localized(), image: "🌎")
    ]
    
    var coodinator: SettingsCoordinator
    
    init(coodinator: SettingsCoordinator) {
        self.coodinator = coodinator
    }
    
    func presentSettingView() {
        coodinator.navigateToAppleSettings()
    }
}
