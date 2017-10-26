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
    /// - Parameter request: APIRequest which needs to be performed
    /// - Returns: APIResponse - tuple with data and HTTPURLResponse
    func performRequest(request: APIRequest) -> Result<APIResponse>
}
