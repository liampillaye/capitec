//
//  HttpErrors.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

enum HttpClientError: Error {
    case unauthorized
    case invalidUrl
    case NetworkError
}
