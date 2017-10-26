//
//  AlbumRequest.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct AlbumRequest: APIRequest {
    let albumTitle: String
    init(albumTitle: String) {
        self.albumTitle = albumTitle
    }
    
    var path: String { return "database/search?release_title=\(self.albumTitle)" }
}
