//
//  APIRequest.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Defines request's method
enum Method: String {
    case GET, POST, PUT, DELETE
}

protocol APIRequest {
    
    /// HTTP method
    var method: Method { get }
    
    /// Path to resource
    var path: String { get }
    
    /// HTTP method
    var service: APIService { get }
    
    var query: [String: APIQueryParameter] { get }
}

// MARK: - Default values for API request
extension APIRequest {
    
    var method: Method { return .GET }
    
    var service: APIService { return DiscoGSService() }
    
    var query: [String: APIQueryParameter] { return [:] }
}

extension APIRequest {
    
    func serializeToQuery() -> [URLQueryItem] {
        return self.query.flatMap { serializeToQueryComponent(key: $0, value: $1) }
    }
    
    private func serializeToQueryComponent(key: String, value: APIQueryParameter) -> [URLQueryItem] {
        switch value {
            case .bool(let bool):
                return [URLQueryItem(name: key, value: bool ? "1" : "0")]
            case .double(let double):
                return [URLQueryItem(name: key, value: "\(double)")]
            case .int(let int):
                return [URLQueryItem(name: key, value: "\(int)")]
            case .string(let string):
                return [URLQueryItem(name: key, value: string)]
        }
    }
}
