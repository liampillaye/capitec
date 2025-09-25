//
//  ProductsResponse.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id, name, description: String
    let minAmount, maxAmount, minTerm, maxTerm: Int
    let interestRateRange: InterestRateRange
    let purposes: [String]
}

// MARK: - InterestRateRange
struct InterestRateRange: Codable {
    let min, max: Double
}
