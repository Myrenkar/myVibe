//
//  Result.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
