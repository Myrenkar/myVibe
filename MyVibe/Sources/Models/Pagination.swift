//
//  Pagination.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct Pagination: Codable {
    let items: Int
    let page: Int
    let pages: Int
    let perPage: Int
    let urls: URLS
    
    private enum CodingKeys: String, CodingKey {
        case items
        case page
        case pages
        case perPage = "per_page"
        case urls
    }
}

struct URLS: Codable {
    let last: String?
    let next: String?
}
