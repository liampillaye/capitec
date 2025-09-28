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
