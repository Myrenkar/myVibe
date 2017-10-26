//
//  UntypedError.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

struct UntypedError: Error, CustomStringConvertible {
    
    // MARK: Properties
    
    private let reason: String
    
    // MARK: Initializers

    /// Initializes the error
    ///
    /// - Parameter reason: The reason of the error
    init(reason: String) {
        self.reason = reason
    }
    
    init() {
        self.init(reason: "Unknown error")
    }
    
    var description: String { return reason }
    
}
