//
//  ReleasesRequest.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct ReleasesRequest: APIRequest {
    let releaseId: Int
    
    init(releaseId: Int) {
        self.releaseId = releaseId
    }
    
    var path: String { return "releases/\(self.releaseId)" }
}
