//
//  URLRequest.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

extension URLRequest {

    /// Convenience initializer for APIRequest
    ///
    /// - Parameter request: Request which needs to be executed
    /// - Throws: APIRequestError.incorrectURL when url could not be created
    init(request: APIRequest) throws {
        guard let url = URLComponents(request: request).url else {
            throw APIError.incorrectURL(url: request.path)
        }
        let stringURL = String(describing: url).removingPercentEncoding
        let newUrl = URL(string: stringURL!)
        self.init(url: newUrl!)
        
        httpMethod = request.method.rawValue
        allHTTPHeaderFields = [
            "Accept": "application/json",
            "Content-Type": "application/json; charset=uft-8"
        ]
    }
    
}
