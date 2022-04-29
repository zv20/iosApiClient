//
//  Customer.swift
//  iosApiClient
// integreat me
//  Created by Zhivko Vanev on 28.04.22.
// hdhdh 

import Foundation
import Fluent


struct Customer: Identifiable, Codable {
    let id: UUID?
    var name: String
}

