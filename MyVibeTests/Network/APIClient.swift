//
//  APIClient.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

final class MockAPIClient: APIClient {
    private(set) var timesCalled = 0
    
    private let expectedResult: APIResponse?
    private let expectedError: Error?
    
    init(expectedResult: APIResponse? = nil, expectedError: Error? = nil) {
        self.expectedResult = expectedResult
        self.expectedError = expectedError
    }
    
    func perform(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ()) {
        timesCalled += 1
        
        if let error = expectedError {
            completionHandler(Result.failure(error))
        }
        if let result = expectedResult {
            completionHandler(Result.success(result))
        }
        fatalError()
    }
}
