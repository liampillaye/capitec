//
//  LoanEligibilitySimulatorManager.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

protocol LoanEligibilitySimulatorManager {
    func fetchAndSaveValidationRules() throws
    func fetchPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo
    func fetchFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo
    func fetchLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails

}

final class DefaultLoanEligibilitySimulatorManager: LoanEligibilitySimulatorManager {
    
    //MARK: PROPERTIES
    private let service: LoanEligibilitySimulatorService
    private let validationRepository: ValidationRulesRepository
    
    //MARK: INITS
    init(service: LoanEligibilitySimulatorService, validationRepository: ValidationRulesRepository) {
        self.service = service
        self.validationRepository = validationRepository
    }
    
    //MARK: PUBLIC METHODS
    func fetchAndSaveValidationRules() throws {
        
        do {
            let validationRulesResponse = try service.getValidationRules()
            
            let validationRulePersonalInfo = ValidationRulePersonalInfo(age: validationRulesResponse.personalInfo.age,
                                                                        employmentStatus: validationRulesResponse.personalInfo.employmentStatus,
                                                                        employmentDuration: validationRulesResponse.personalInfo.employmentDuration)
            
            let validationRuleLoanDetails = ValidationRuleLoanDetails(requestedAmount: validationRulesResponse.loanDetails.requestedAmount,
                                                                      loanTerm: validationRulesResponse.loanDetails.loanTerm)
            
            
            
            let validationRuleFinancialInfo = ValidationRuleFinancialInfo(monthlyIncome: validationRulesResponse.financialInfo.monthlyIncome,
                                                                          monthlyExpenses: validationRulesResponse.financialInfo.monthlyExpenses,
                                                                          creditScore: validationRulesResponse.financialInfo.creditScore)
            
            
            validationRepository.insertOrReplaceValidationRules(ValidationRules(personalInfo: validationRulePersonalInfo,
                                                                                loanDetails: validationRuleLoanDetails,
                                                                                financialInfo: validationRuleFinancialInfo))
        } catch {
            throw error //Handle Custom error here
        }
    }
    
    func fetchPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo {
        try validationRepository.findPersonalInfoValidationRules()
    }
    
    func fetchFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo {
        try validationRepository.findFinancialInfoValidationRules()
    }
    
    func fetchLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails {
        try validationRepository.findLoanDetailsValidationRules()
    }
}
