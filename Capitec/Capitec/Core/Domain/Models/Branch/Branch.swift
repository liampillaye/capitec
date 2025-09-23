//
//  Branch.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

// MARK: - Branches
struct Branches: Codable {
    let branches: [Branch]

    enum CodingKeys: String, CodingKey {
        case branches = "Branches"
    }
}

// MARK: - Branch
struct Branch: Codable {
    let id: String
    let code: JSONNull?
    let latitude, longitude: Double
    let name, addressLine1: String
    let addressLine2, openingHours, saturdayHours, sundayHours: JSONNull?
    let publicHolidayHours: JSONNull?
    let city, province: String
    let isATM, cashAccepting, handlesHomeLoans, isClosed: Bool
    let businessBankCenter: Bool

    enum CodingKeys: String, CodingKey {
        case id = "Id"
        case code = "Code"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case name = "Name"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case openingHours = "OpeningHours"
        case saturdayHours = "SaturdayHours"
        case sundayHours = "SundayHours"
        case publicHolidayHours = "PublicHolidayHours"
        case city = "City"
        case province = "Province"
        case isATM = "IsAtm"
        case cashAccepting = "CashAccepting"
        case handlesHomeLoans = "HandlesHomeLoans"
        case isClosed = "IsClosed"
        case businessBankCenter = "BusinessBankCenter"
    }
}
