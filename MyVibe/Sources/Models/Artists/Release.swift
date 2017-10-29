//
//  Release.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

struct Release: Codable {
    
    let styles: [String]
    let released: String
    let artists: [Artist]
    let thumb: String?
    let title: String
}
