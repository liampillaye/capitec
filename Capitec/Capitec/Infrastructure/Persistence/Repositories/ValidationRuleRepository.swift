//
//  ValidationRepository.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

enum ValidationRuleRepositoryError: Error {
    case noValidationRulesFound
}

protocol ValidationRulesRepository {
    func insertOrReplaceValidationRules(_ validationRules: ValidationRules)
    func findPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo
    func findLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails
    func findFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo
}

final class DefaultValidationRulesRepository: ValidationRulesRepository {
    
    private(set) var inMemoryValidationRules: ValidationRules? = nil

    func findPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo {
        guard let personalInfoRules = inMemoryValidationRules?.personalInfo else {
            throw ValidationRuleRepositoryError.noValidationRulesFound
        }
        return personalInfoRules
    }
    
    func findLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails {
        guard let loanDetailsRules = inMemoryValidationRules?.loanDetails else {
            throw ValidationRuleRepositoryError.noValidationRulesFound
        }
        return loanDetailsRules
    }
    
    func findFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo {
        guard let financialInfoRules = inMemoryValidationRules?.financialInfo else {
            throw ValidationRuleRepositoryError.noValidationRulesFound
        }
        return financialInfoRules
    }
    
    func insertOrReplaceValidationRules(_ validationRules: ValidationRules) {
        inMemoryValidationRules = validationRules
    }
}

