//
//  CalculateRateRequest.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct CalculateRateRequest: Codable {
    let loanAmount, loanTerm, creditScore: Int
    let loanType: String
}
