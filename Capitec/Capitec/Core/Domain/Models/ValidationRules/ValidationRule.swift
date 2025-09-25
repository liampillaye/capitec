//
//  ValidationRule.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct ValidationRule: Codable {
    let min: Int
    let max: Int?
    let required: Bool
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case min, max
        case required = "required"
        case errorMessage
    }
}
