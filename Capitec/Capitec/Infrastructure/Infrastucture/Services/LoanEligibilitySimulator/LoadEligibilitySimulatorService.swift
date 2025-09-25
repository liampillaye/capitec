//
//  LoadEligibilitySimulatorService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

protocol LoanEligibilitySimulatorService {
    func eligiblity() async throws -> EligibilityResponse
    func getProducts() async throws -> [Product]
    func calculateRate() async throws -> CalculateRateResponse
    func getValidationRules() async throws -> ValidationRulesResponse
}
