//
//  Album.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct Album: Codable {
    let title: String
    let style: [String]?
    let thumb: String?
    let uri: String
    let type: String
    let id: Int
    let resourceURL: String
    
    private enum CodingKeys: String, CodingKey {
        case title
        case style
        case thumb
        case uri
        case type
        case id
        case resourceURL = "resource_url"
    }
}
