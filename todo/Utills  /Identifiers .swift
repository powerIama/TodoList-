//
//  Identifiers .swift
//  todo
//
//  Created by Demian Basistyi on 12/13/24.
//

import Foundation

enum Identifiers: CaseIterable {
    case incompletedCollectionIdentifer
    case completedCollectionIdentifer
    
    var key: String {
        switch self {
        case .incompletedCollectionIdentifer: return "IncompletedCollectionCell"
        case .completedCollectionIdentifer: return "CompletedCollectionCell"
        }
    }
}
