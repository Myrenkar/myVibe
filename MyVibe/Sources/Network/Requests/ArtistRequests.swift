//
//  ArtistRequests.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct ArtistRequest: APIRequest {
    let artistId: Int
    
    init(artistId: Int) {
        self.artistId = artistId
    }
    
    var path: String { return "artists/\(self.artistId)" }
    
}
