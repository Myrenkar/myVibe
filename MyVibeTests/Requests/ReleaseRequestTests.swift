//
//  ReleaseRequestTests.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 29/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

final class ReleaseRequestTests: XCTestCase {
    
    var sut: ReleasesRequest!
    
    override func setUp() {
        super.setUp()
        sut = ReleasesRequest(releaseId: 999)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProperties() {
        XCTAssertEqual(sut.path, "releases/999")
        XCTAssertEqual(sut.method, Method.GET)
    }
    
    func testService() {
        let service = DiscoGSService()
        XCTAssertEqual(sut.service.host, service.host)
        XCTAssertEqual(sut.service.scheme, service.scheme)
    }
}
