//
//  DefaultHttpClient.swift
//  Capitec
//
//  Created by Liam Pillaye.
//

import Foundation

class DefaultHttpClient: HttpClient {
    
    
    //MARK: PUBLIC FUNCTIONS

    public func get<T: Response>(for urlString: String, queryStringParams: [URLQueryItem]?) async throws -> T {

        guard var url = URL(string: urlString) else {
            throw HttpClientError.invalidUrl
        }
        
        if let params = queryStringParams {
            url.append(queryItems: params)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return try await perform(for: request)
    }
    
    public func put<T: Response>(for urlString: String,
                                 queryStringParams: [URLQueryItem]? = nil,
                                 headers: [String: String]? =  nil,
                                 bodyComponents: [String:Any]? = nil) async throws -> T {
        guard var url = URL(string: urlString) else {
            throw HttpClientError.invalidUrl
        }
        
        //QUERYSTRING PARAMS
        if let params = queryStringParams {
            url.append(queryItems: params)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        //HTTP HEADERS
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        
        //HTTP BODY
        if let bodyComponents = bodyComponents {
            
            var queryItems: [URLQueryItem] = []
            for bodyComponent in bodyComponents {
                queryItems.append(URLQueryItem(name: bodyComponent.0, value: String(describing: bodyComponent.1)))
            }
            
            var bodyUrlComponents = URLComponents()
            bodyUrlComponents.queryItems = queryItems
            let bodyData = bodyUrlComponents.query?.data(using: .utf8)
            request.httpBody = bodyData
        }

        return try await perform(for: request)
    }
    
    public func patch<T: Response>(for urlString: String,
                                    headers: [String: String]?,
                                   patchData: Data?) async throws -> T {
        guard let url = URL(string: urlString) else {
            throw HttpClientError.invalidUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        
        //HTTP HEADERS
        if let headers = headers {
            request.allHTTPHeaderFields = headers
        }
        
        //HTTP BODY
        if let patchData = patchData {
            request.httpBody = patchData
        }
                
        return try await perform(for: request)
    }
    
    //MARK: PRIVATE FUNCTIONS
    
    private func perform<T: Response>(for request: URLRequest) async throws -> T {
        let (data, resp) = try await URLSession.shared.data(for: request)
        
        guard (resp as? HTTPURLResponse)?.statusCode == 200 else
        {
            throw HttpClientError.NetworkError
        }
        
        let response = try JSONDecoder().decode(T.self, from:data)
        return response

    }
}
