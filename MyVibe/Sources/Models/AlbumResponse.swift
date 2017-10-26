//
//  AlbumResponse.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct AlbumResponse: Codable {
    let pagination: Pagination
    let albums: [Album]
    
    private enum CodingKeys: String, CodingKey {
        case pagination
        case albums = "results"
    }
}
