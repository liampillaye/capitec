//
//  ValidationRule.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct ValidationRule: Codable {
    let required: Bool
    let errorMessage: String
    let min: Int?
    let max: Int?
    let options: [String]?
    
    enum CodingKeys: String, CodingKey {
        case min, max, options
        case required = "required"
        case errorMessage
    }
}
