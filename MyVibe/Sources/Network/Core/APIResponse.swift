//
//  APIResponse.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//


import Foundation

/// Represents API response
struct APIResponse {
    let data: Data?
    let response: HTTPURLResponse
}
