//
//  String+extension.swift
//  todo
//
//  Created by Demian Basistyi on 12/16/24.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
