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
    
}

// MARK: - Default values for API request
extension APIRequest {
    
    var method: Method { return .GET }
    
    var service: APIService { return DiscoGSService() }
    
}

