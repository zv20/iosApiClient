//
//  Member.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 8.05.22.
//

import Foundation

struct Member: Identifiable, Codable {
    let id: UUID?
    var name: String
    var family: String
    var email: String
    var number: Int
    var school: String
    var memberUUID: String
}
