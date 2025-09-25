//
//  EligiblityRequest.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - EligibilityRequest
struct EligibilityRequest: Codable {
    let personalInfo: PersonalInfo
    let financialInfo: FinancialInfo
    let loanDetails: LoanDetails
}

// MARK: - FinancialInfo
struct FinancialInfo: Codable {
    let monthlyIncome, monthlyExpenses, existingDebt, creditScore: Int
}

// MARK: - LoanDetails
struct LoanDetails: Codable {
    let requestedAmount, loanTerm: Int
    let loanPurpose: String
}

// MARK: - PersonalInfo
struct PersonalInfo: Codable {
    let age: Int
    let employmentStatus: String
    let employmentDuration: Int
}
