//
//  AuthorizationControllerTests.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

final class AuthorizationControllerTests: XCTestCase {
    
    var sut: AuthorizationController!
    var request: URLRequest!
    
    override func setUp() {
        super.setUp()
        let mockedKeys = Keys(secretKeys: MyVibeKeys())
        sut = AuthorizationController(keys: mockedKeys)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProperties() {
        do {
            let albumRequest = AlbumRequest(albumTitle: "fixed.title")
            request = try URLRequest(request: albumRequest)
        } catch let error {
            fatalError(error.localizedDescription)
        }
        sut.authorizeRequest(request: &request!)
        XCTAssertEqual(request.allHTTPHeaderFields?.keys.contains("Authorization"), true)
    }
}

