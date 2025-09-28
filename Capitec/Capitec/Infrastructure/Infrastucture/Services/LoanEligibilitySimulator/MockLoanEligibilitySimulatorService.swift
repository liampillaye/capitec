//
//  MockLoanEligibilitySimulatorService.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class MockLoanEligibilitySimulatorService: LoanEligibilitySimulatorService {
    func eligiblity() throws -> EligibilityResponse {
        let bundle = Bundle(for: type(of: self))
        let eligibilityResponse: EligibilityResponse = bundle.decode(Constants.Mocks.Loans.eligibility)
        return eligibilityResponse
    }
    
    func getProducts() throws -> [Product] {
        let bundle = Bundle(for: type(of: self))
        let productResponse: ProductResponse = bundle.decode(Constants.Mocks.Loans.products)
        return productResponse.products
    }
    
    func calculateRate() throws -> CalculateRateResponse {
        throw HttpClientError.notImplemented

    }
    
    func getValidationRules() throws -> ValidationRulesResponse {
        let bundle = Bundle(for: type(of: self))
        let validationRulesResponse: ValidationRulesResponse = bundle.decode(Constants.Mocks.Loans.valdiationRules)
        return validationRulesResponse
    }
    
    
}
