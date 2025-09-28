//
//  MockLoanEligibilitySimulatoryManager.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

final class MockLoanEligibilitySimulatorManager: LoanEligibilitySimulatorManager {
    func checkEligibility() throws -> Eligibility {
        return Eligibility(
            eligibilityResult: EligibilityResult(
                isEligible: true,
                approvalLikelihood: 85,
                riskCategory: "low",
                decisionReason: "Strong income-to-expense ratio and manageable existing debt"),
            recommendedLoan: RecommendedLoan(
                maxAmount: 180000,
                recommendedAmount: 150000,
                interestRate: 12.5,
                monthlyPayment: 7089.50,
                totalRepayment: 17014800),
            affordabilityAnalysis: AffordabilityAnalysis(
                disposableIncome: 10000.00,
                debtToIncomeRatio: 20.0,
                loanToIncomeRatio: 60.0,
                affordabilityScore: "good"))
    }
    
    func fetchAndSaveValidationRules() throws {
        //TODO
    }
    
    func fetchPersonalInfoValidationRules() throws -> ValidationRulePersonalInfo {
        ValidationRulePersonalInfo(
            age: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil),
            employmentStatus: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil),
            employmentDuration: ValidationRule(
                required: true,
                errorMessage: "Test",
                min: 0,
                max: 0,
                options: nil))
    }
    
    func fetchFinancialInfoValidationRules() throws -> ValidationRuleFinancialInfo {
        ValidationRuleFinancialInfo(monthlyIncome: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), monthlyExpenses: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), creditScore: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil))
    }
    
    func fetchLoanDetailsValidationRules() throws -> ValidationRuleLoanDetails {
        ValidationRuleLoanDetails(requestedAmount: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil), loanTerm: ValidationRule(required: true, errorMessage: "Test", min: 0, max: 0, options: nil))
    }
    
    func fetchAndSaveValidationRules() async throws {
        //TODO
    }
    
    func calculateRate() throws -> CalculateRate {
        return mockCalculateRate
    }
}
