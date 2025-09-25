//
//  ValidationRuleEmploymentStatus.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct ValidationRuleEmploymentStatus: Codable {
    let employmentStatusRequired: Bool
    let options: [String]
    let errorMessage: String

    enum CodingKeys: String, CodingKey {
        case employmentStatusRequired = "required"
        case options, errorMessage
    }
}
