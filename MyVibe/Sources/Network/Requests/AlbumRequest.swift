//
//  AlbumRequest.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct AlbumRequest: APIRequest {
    private let albumTitle: String
    
    init(albumTitle: String) {
        self.albumTitle = albumTitle
    }
    
    var query: [String : APIQueryParameter] {
        return [
            "track" : .string(self.albumTitle)
        ]
    }
    
    var path: String { return "database/search" }
}
