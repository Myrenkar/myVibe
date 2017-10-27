//
//  Keys.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

internal struct Keys {
    let apiToken: String
    
    init(secretKeys keys: MyVibeKeys = MyVibeKeys()) {
        apiToken = keys.aPIToken
    }
}
