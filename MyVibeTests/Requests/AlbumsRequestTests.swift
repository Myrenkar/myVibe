//
//  AlbumsRequestTests.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

final class AlbumsRequestTest: XCTestCase {
    
    var sut: AlbumRequest!
    
    override func setUp() {
        super.setUp()
        sut = AlbumRequest(albumTitle: "fixed.title", page: 10)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProperties() {
        XCTAssertEqual(sut.path, "database/search")
        XCTAssertEqual(sut.method, Method.GET)
    }
    
    func testQuery() {
        var query: [String : APIQueryParameter] {
            return [
                 "page" : .int(10),
                "track" : .string("fixed.title")
               
            ]
        }
        XCTAssertEqual(sut.query, query)
    }
    
    func testService() {
        let service = DiscoGSService()
        XCTAssertEqual(sut.service.host, service.host)
        XCTAssertEqual(sut.service.scheme, service.scheme)
    }
}
