//
//  Foundation.String.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import Foundation

extension String {
    /// Localize the string
    ///
    /// - Parameters:
    ///   - key: ket
    ///   - comment: comment
    /// - Returns: localized version
    static func localized(_ key: String, comment: String? = nil) -> String {
        return NSLocalizedString(key, comment: comment ?? "")
    }
}
