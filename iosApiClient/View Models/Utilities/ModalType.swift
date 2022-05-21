//
//  ModalType.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
       
        }
    }
    
    case add
    
    case update(Member)
}
