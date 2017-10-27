//
//  AuthorizationController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class AuthorizationController {
    
    private let keys: Keys
    
    init(keys: Keys = Keys()) {
        self.keys = keys
    }
    
    func authorizeRequest(request: inout URLRequest) {
        let headerValue = "Discogs token=\(keys.apiToken)"
        request.setValue(headerValue, forHTTPHeaderField: "Authorization")
    }
}
