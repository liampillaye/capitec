//
//  ValidationRulesResponse.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - ValidationRulesResponse
struct ValidationRulesResponse: Codable {
    let personalInfo: PersonalInfoResponse
    let financialInfo: FinancialInfoResponse
    let loanDetails: LoanDetailsResponse
}

// MARK: - FinancialInfoResponse
struct FinancialInfoResponse: Codable {
    let monthlyIncome, monthlyExpenses, creditScore: ValidationRule
}


// MARK: - LoanDetailsResponse
struct LoanDetailsResponse: Codable {
    let requestedAmount, loanTerm: ValidationRule
}

// MARK: - PersonalInfoResponse
struct PersonalInfoResponse: Codable {
    let age: ValidationRule
    let employmentStatus: ValidationRule
    let employmentDuration: ValidationRule
}
