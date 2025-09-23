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
    let id, code: String?
    let latitude, longitude: Double
    let name, addressLine1: String
    let addressLine2: String?
    let openingHours: OpeningHours?
    let saturdayHours: SaturdayHours?
    let sundayHours: SundayHours?
    let publicHolidayHours: PublicHolidayHours?
    let city: City
    let province: Province
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

enum City: String, Codable {
    case atlantis = "Atlantis"
    case capeTown = "Cape town"
    case cityCapeTown = "Cape Town"
    case eastLondon = "East London"
    case kingWilliamsTown = "King Williams Town"
    case qonce = "Qonce"
}

enum OpeningHours: String, Codable {
    case mondayFriday830Am5Pm = "Monday - Friday, 8:30am - 5pm"
    case mondayFriday8Am5Pm = "Monday - Friday, 8am - 5pm"
    case mondayFriday9Am6Pm = "Monday - Friday, 9am - 6pm"
}

enum Province: String, Codable {
    case eCape = "E Cape"
    case easternCape = "Eastern Cape"
    case wCape = "W Cape"
    case westernCape = "Western Cape"
}

enum PublicHolidayHours: String, Codable {
    case closedOnPublicHolidays = "Closed on Public Holidays"
}

enum SaturdayHours: String, Codable {
    case saturday830Am12Pm = "Saturday, 8:30am - 12pm"
    case saturday8Am1Pm = "Saturday, 8am - 1pm"
    case saturday9Am2Pm = "Saturday, 9am - 2pm"
}

enum SundayHours: String, Codable {
    case closedOnSundays = "Closed on Sundays"
}

