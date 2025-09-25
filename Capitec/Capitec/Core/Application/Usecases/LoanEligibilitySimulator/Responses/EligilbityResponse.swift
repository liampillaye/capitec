//
//  EligilbityResponse.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - EligibilityResponse
struct EligibilityResponse: Codable {
    let eligibilityResult: EligibilityResult
    let recommendedLoan: RecommendedLoan
    let affordabilityAnalysis: AffordabilityAnalysis
}

// MARK: - AffordabilityAnalysis
struct AffordabilityAnalysis: Codable {
    let disposableIncome, debtToIncomeRatio, loanToIncomeRatio: Int
    let affordabilityScore: String
}

// MARK: - EligibilityResult
struct EligibilityResult: Codable {
    let isEligible: Bool
    let approvalLikelihood: Int
    let riskCategory, decisionReason: String
}

// MARK: - RecommendedLoan
struct RecommendedLoan: Codable {
    let maxAmount, recommendedAmount: Int
    let interestRate, monthlyPayment: Double
    let totalRepayment: Int
}
