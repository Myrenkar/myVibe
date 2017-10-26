//
//  APIClient.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

protocol APIClient {
    
    /// Performs specific request
    ///
    /// - Parameters:
    ///   - request: APIRequest which needs to be performed
    ///   - completionHandler: callback with result of type APIResponse
    func perform(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ())
}
