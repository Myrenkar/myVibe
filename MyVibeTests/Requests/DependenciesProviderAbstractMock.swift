//
//  DependenciesProviderAbstractMock.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

class DependenciesProviderAbstractMock: ApplicationDependenciesProvider {
    private(set) lazy var apiClient: APIClient = {
        fatalError("APIClient has not been implemented")
    }()
}

