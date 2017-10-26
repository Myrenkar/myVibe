//
//  AuthorizationController.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class AuthorizationController {
    func authorizeRequest(request: inout URLRequest) {
        let headerValue = "Discogs token=cifChxxYLeRKBHtHqEoBdhfvljiCTHZUTTpgSFWx"
        request.setValue(headerValue, forHTTPHeaderField: "Authorization")
    }
}
