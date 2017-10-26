//
//  URLComponents.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

extension URLComponents {
    
    /// Convenience initializer for APIRequest
    ///
    /// - Parameter request: Request which needs to be executed
    init(request: APIRequest) {
        self = {
            var components = URLComponents()
            
            components.scheme = request.service.scheme.rawValue
            components.host = request.service.host
            components.path = "/" + request.path
            
            return components
        }()
    }
    
}
