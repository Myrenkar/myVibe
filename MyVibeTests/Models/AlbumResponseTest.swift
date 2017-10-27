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
        
        XCTAssertEqual(sut.pagination.perPage, 50)
        XCTAssertEqual(sut.pagination.pages, 13)
        XCTAssertEqual(sut.pagination.page, 1)
        XCTAssertEqual(sut.pagination.items, 626)
        XCTAssertEqual(sut.pagination.urls.last, "https://api.discogs.com/database/search?track=kylie&per_page=50&page=13")
        XCTAssertEqual(sut.pagination.urls.next, "https://api.discogs.com/database/search?track=kylie&per_page=50&page=2")
        XCTAssertEqual(sut.albums.isEmpty, false)
        XCTAssertEqual(sut.albums.first!.title, "Akcent - Kylie")
        XCTAssertEqual(sut.albums.first!.resourceURL, "https://api.discogs.com/releases/1240341")
        XCTAssertEqual(sut.albums.first!.id, 1240341)
        XCTAssertEqual(sut.albums.first!.thumb, "https://img.discogs.com/g1fAFuI9iugY-KDibEnORokcXk8=/fit-in/150x150/filters:strip_icc():format(jpeg):mode_rgb():quality(40)/discogs-images/R-1240341-1269872742.jpeg.jpg")
  }
}
