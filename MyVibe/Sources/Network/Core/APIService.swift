//
//  APIService.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Scheme for the service
enum Scheme: String {
    case HTTP = "http"
    case HTTPS = "https"
}


/// Interface for the API services
protocol APIService {
    
    /// Connection scheme, default `http`
    var scheme: Scheme { get }
    
    /// Base url as string
    var host: String { get }
    
}

extension APIService {
    
    /// Default scheme `https`
    var scheme: Scheme { return .HTTPS }
    
}

