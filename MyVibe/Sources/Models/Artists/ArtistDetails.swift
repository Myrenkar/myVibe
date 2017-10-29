//
//  ArtistDetails.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct ArtistDetails: Codable {
    let profile: String?
    let members: [Member]?
}
