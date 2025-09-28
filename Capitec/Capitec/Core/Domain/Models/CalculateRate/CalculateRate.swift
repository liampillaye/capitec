//
//  CalculateRate.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

struct CalculateRate {
    let interestRate, monthlyPayment: Double
    let totalInterest, totalRepayment: Double
    let paymentSchedule: [MontlyPaymentSchedule]
}

struct MontlyPaymentSchedule: Identifiable {
    let id = UUID()
    let month: Int
    let payment, principal, interest, balance: Double
}
