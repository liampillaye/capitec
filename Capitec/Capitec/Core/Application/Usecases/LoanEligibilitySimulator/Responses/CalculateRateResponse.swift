//
//  RateResponse.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - RateResponse
struct CalculateRateResponse: Codable {
    let interestRate, monthlyPayment: Double
    let totalInterest, totalRepayment: Double
    let paymentSchedule: [PaymentSchedule]
}

// MARK: - PaymentSchedule
struct PaymentSchedule: Codable {
    let month: Int
    let payment, principal, interest, balance: Double
}
