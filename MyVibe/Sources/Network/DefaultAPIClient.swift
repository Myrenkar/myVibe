//
//  DefaultAPIClient.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

final class DefaultAPIClient: APIClient {
    
    // MARK: Properties
    
    private let session: URLSession
    
    // MARK: Initializers
    
    /// Initializes DefaultAPIClient
    ///
    /// - Parameter session: URLSession to use - default is `.shared`
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func performRequest(request: APIRequest) -> Result<APIResponse> {
        do {
            let urlRequest = try URLRequest(request: request)
            var result: Result<APIResponse>!
            
            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                if let error = error {
                    if (error as NSError).code == -1009 {
                        result = Result<APIResponse>.failure(APIError.internetConnectionUnavailable)
                    } else {
                        result = Result<APIResponse>.failure(error)
                    }
                    result = Result<APIResponse>.failure(error)
                } else if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        result = Result<APIResponse>.success(APIResponse(data: data, response: response))
                    } else {
                        result = Result<APIResponse>.failure(APIError.unexpectedStatusCode(statusCode: response.statusCode))
                    }
                } else {
                    result = Result<APIResponse>.failure(APIError.noResponse)
                }
            }
            task.resume()
            return result
        } catch let error {
            return Result<APIResponse>.failure(error)
        }
    }
    
}
