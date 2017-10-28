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
    private let page: Int
    
    init(albumTitle: String, page: Int) {
        self.albumTitle = albumTitle
        self.page = page
    }
    
    var query: [String : APIQueryParameter] {
        return [
            "track" : .string(self.albumTitle),
            "page" : .int(self.page)
        ]
    }
    
    var path: String { return "database/search" }
}
