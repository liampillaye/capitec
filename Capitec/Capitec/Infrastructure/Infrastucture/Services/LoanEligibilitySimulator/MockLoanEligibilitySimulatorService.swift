//
//  MockLoanEligibilitySimulatorService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class MockLoanEligibilitySimulatorService: LoanEligibilitySimulatorService {
    func eligiblity() async throws -> EligibilityResponse {
        throw HttpClientError.notImplemented
    }
    
    func getProducts() async throws -> [Product] {
        throw HttpClientError.notImplemented
    }
    
    func calculateRate() async throws -> CalculateRateResponse {
        throw HttpClientError.notImplemented

    }
    
    func getValidationRules() async throws -> ValidationRulesResponse {
        let bundle = Bundle(for: type(of: self))
        let validationRulesResponse: ValidationRulesResponse = bundle.decode(Constants.Mocks.Loans.valdiationRules)
        return validationRulesResponse
    }
    
    
}
