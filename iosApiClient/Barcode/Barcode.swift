//
//  Barcode.swift
//  iosApiClient
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Foundation

struct Barcode: Identifiable, Codable {
    let id: UUID?
    var codeB: String
}
