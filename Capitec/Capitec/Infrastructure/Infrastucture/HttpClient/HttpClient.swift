//
//  HttpClient.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

protocol HttpClient {
    func get<T: Response>(for urlString: String,
                          queryStringParams: [URLQueryItem]?) async throws -> T
    func put<T: Response>(for urlString: String,
                          queryStringParams: [URLQueryItem]?,
                          headers: [String: String]?,
                          bodyComponents: [String:Any]?) async throws -> T
    func patch<T: Response>(for urlString: String,
                            headers: [String: String]?,
                            patchData: Data?) async throws -> T
}
