//
//  RemoteImageDownloader.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 28/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

final class RemoteImageDownloader {
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func downloadImage(withURL url: URL, completionHandler: @escaping (Result<UIImage>) -> ()) {
        DispatchQueue.global(qos: .background).async {
            let task = self.session.dataTask(with: url, completionHandler: { data, response, error in
                if let response = response as? HTTPURLResponse {
                    if 200..<300 ~= response.statusCode {
                        let apiResponse = APIResponse(data: data, response: response)
                        guard let data = apiResponse.data, let image = UIImage(data: data) else {
                            completionHandler(Result.failure(UntypedError(reason: "Couldnt donload the image")))
                            return
                        }
                        
                        completionHandler(Result.success(image))
                    }
                } else {
                    completionHandler(Result.failure(UntypedError(reason: "Couldnt donload the image")))
                }
            })
            task.resume()
        }
    }
}

