//
//  AlbumResponseTest.swift
//  MyVibeTests
//
//  Created by Piotr Torczyński on 27/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import XCTest
@testable import MyVibe

final class AlbumResponseTest: XCTestCase {
    
    var sut: AlbumResponse!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "AlbumResponse", withExtension: "json") else {
            XCTFail("AlbumResponse.json not found")
            return
        }
        do {
            let decoder = JSONDecoder()
            sut = try decoder.decode(AlbumResponse.self, from: Data(contentsOf: url))
        }  catch (let error) {
            XCTFail("initilization failure \(error.localizedDescription)")
        }
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testProperties() {
        XCTAssertEqual(sut.pagination.pages, 13)
        XCTAssertEqual(sut.pagination.page, 1)
        XCTAssertEqual(sut.pagination.items, 626)
        XCTAssertEqual(sut.albums.isEmpty, false)
        XCTAssertEqual(sut.albums.first!.title, "Akcent - Kylie")
        XCTAssertEqual(sut.albums.first!.id, 1240341)
    }
}
