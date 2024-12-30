//
//  Date+extension.swift
//  todo
//
//  Created by Demian Basistyi on 12/23/24.
//

import Foundation

extension Date {
    func toString(format: String = "yyyy-MM-dd") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format 
        return formatter.string(from: self)
    }
}
