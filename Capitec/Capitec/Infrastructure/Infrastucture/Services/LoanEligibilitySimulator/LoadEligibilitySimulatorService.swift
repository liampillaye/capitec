//
//  LoadEligibilitySimulatorService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

protocol LoanEligibilitySimulatorService {
    func eligiblity() throws -> EligibilityResponse
    func getProducts() throws -> [Product]
    func calculateRate() throws -> CalculateRateResponse
    func getValidationRules() throws -> ValidationRulesResponse
}
