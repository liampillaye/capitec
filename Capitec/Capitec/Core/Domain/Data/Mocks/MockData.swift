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
