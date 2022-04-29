//
//  Customer.swift
//  iosApiClient
// 
//  Created by Zhivko Vanev on 28.04.22.
//

import Foundation



struct Customer: Identifiable, Codable {
    let id: UUID?
    var name: String
}

