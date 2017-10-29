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
    private let autorizationController: AuthorizationController
    private let networkActivityManager: NetworkActivityManager
    
    // MARK: Initializers
    
    /// Initializes DefaultAPIClient
    ///
    /// - Parameter session: URLSession to use - default is `.shared`
    init(session: URLSession = .shared, networkActivityManager: NetworkActivityManager) {
        self.session = session
        self.networkActivityManager = networkActivityManager
        self.autorizationController = AuthorizationController()
    }
    
    func perform(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ()) {
        DispatchQueue.global(qos: .background).async {
            self.send(request: request, completionHandler: completionHandler)
        }
    }
    
    // MARK: Private
    
    private func send(request: APIRequest, completionHandler: @escaping (Result<APIResponse>) -> ()) {
        do {
            var urlRequest = try URLRequest(request: request)
            autorizationController.authorizeRequest(request: &urlRequest)
            networkActivityManager.incrementActivityCount()
            let task = self.session.dataTask(with: urlRequest) { data, response, error in
                self.networkActivityManager.decrementActivityCount()
                if let error = error {
                    if (error as NSError).code == -1009 {
                        completionHandler(Result<APIResponse>.failure(APIError.internetConnectionUnavailable))
                    } else {
                        completionHandler(Result<APIResponse>.failure(error))
                    }
                } else if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        completionHandler(Result<APIResponse>.success(APIResponse(data: data, response: response)))
                    } else if response.statusCode == 401 {
                        completionHandler(Result<APIResponse>.failure(APIError.unAuthorized))
                    } else {
                        completionHandler(Result<APIResponse>.failure(APIError.unexpectedStatusCode(statusCode: response.statusCode)))
                    }
                } else {
                    completionHandler(Result<APIResponse>.failure(APIError.noResponse))
                }
            }
            task.resume()
        } catch let error {
            completionHandler(Result<APIResponse>.failure(error))
        }
    }
}
