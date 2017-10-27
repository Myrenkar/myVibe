//
//  AuthorizationController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class AuthorizationController {
    
    private let keys: MyVibeKeys
    
    init() {
        keys = MyVibeKeys()
    }
    
    func authorizeRequest(request: inout URLRequest) {
        let headerValue = "Discogs token=\(keys.aPIToken)"
        request.setValue(headerValue, forHTTPHeaderField: "Authorization")
    }
}
