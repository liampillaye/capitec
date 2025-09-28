//
//  MockProduct.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

let mockProduct = Product(
    id: "personal_loan",
    name: "Personal Loan",
    description: "Flexible personal financing for various needs",
    minAmount: 5000,
    maxAmount: 300000,
    minTerm: 6,
    maxTerm: 60,
    interestRateRange: mockInterestRateRange,
    purposes: ["debt_consolidation", "home_improvement", "education", "medical", "other"])

let mockInterestRateRange = InterestRateRange(min: 10.5, max: 18.5)

let mockPaymentSchedule: [MontlyPaymentSchedule] = [ MontlyPaymentSchedule(
    month: 1,
    payment: 7089.50,
    principal: 5527.17,
    interest: 1562.33,
    balance: 144472.83)]

let mockCalculateRate = CalculateRate(
    interestRate: 12.5,
    monthlyPayment: 7089.50,
    totalInterest: 20148.00,
    totalRepayment: 170148.00,
    paymentSchedule: mockPaymentSchedule)

let mockPersonalInfo: PersonalInfo = PersonalInfo(
    age: 35,
    employmentStatus: "employed",
    employmentDuration: 24)

let mockFinancialInfo: FinancialInfo = FinancialInfo(
    monthlyIncome: 25000,
    monthlyExpenses: 15000,
    existingDebt: 5000,
    creditScore: 650)

let mockLoanDetails: LoanDetails = LoanDetails(
    requestedAmount: 150000,
    loanTerm: 24,
    loanPurpose: "home_emprovement")


let mockPersonalInfoValidationRule = ValidationRulePersonalInfo(
    age: ValidationRule(required: true,
                        errorMessage: "Age must be between 18 and 65",
                        min: 18,
                        max: 65,
                        options: nil),
    employmentStatus: ValidationRule(required: true,
                                     errorMessage: "Please select your employment status",
                                     min: nil,
                                     max: nil,
                                     options: ["employed", "self_employed", "unemployed", "retired"]),
    employmentDuration: ValidationRule(required: true,
                                       errorMessage: "Minimum 3 months employment required",
                                       min: 3,
                                       max: nil,
                                       options: nil))

let mockFinancialInfoValidationRule = ValidationRuleFinancialInfo(
    monthlyIncome: ValidationRule(required: true,
                                  errorMessage: "Minimum monthly income of R5,000 required",
                                  min: 5000,
                                  max: nil,
                                  options: nil),
    monthlyExpenses: ValidationRule(required: true,
                                    errorMessage: "Please enter your monthly expenses",
                                    min: 0,
                                    max: nil,
                                    options: nil),
    creditScore: ValidationRule(required: false,
                                errorMessage: "Credit score must be between 300 and 850",
                                min: 300,
                                max: 850,
                                options: nil))


let mockLoanDetailsValidationRule = ValidationRuleLoanDetails(
    requestedAmount: ValidationRule(required: true,
                                    errorMessage: "Loan amount must be between R5,000 and R300,000",
                                    min: 5000,
                                    max: 300000,
                                    options: nil),
    loanTerm: ValidationRule(required: true,
                             errorMessage: "Loan term must be between 6 and 60 months",
                             min: 6,
                             max: 60,
                             options: nil))
    
    
