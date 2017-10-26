//
//  APIError.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

/// Error which may occur during creating request
///
/// - incorrectURL: Indicates incorrect URL - might be because of incorrect URL, host or path
/// - unexpectedStatusCode: Response status code was out of accepted range
/// - noResponse: Response was missing or not HTTP response
/// - missingData: Data from response was missing
/// - internetConnectionUnavailable: Internet connection went out
enum APIError: Error {
    case incorrectURL(url: String)
    case unexpectedStatusCode(statusCode: Int)
    case noResponse
    case missingData
    case internetConnectionUnavailable
}

