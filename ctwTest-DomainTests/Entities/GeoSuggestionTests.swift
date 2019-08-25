//
//  GeoSuggestion.swift
//  ctwTest-DomainTests
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import XCTest
@testable import ctwTest_Domain


class GeoSuggestionTests: XCTestCase {

    func testStandardEntityIsValid() {
        let stub = GeoSuggestion.stub()
        XCTAssert(stub.isValid())
    }
    
    func testCountryCannotBeEmpty() {
        let stub = GeoSuggestion.stub()
        stub.county = nil
        XCTAssert(!stub.isValid())
    }
    
    func testCityCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.city = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testCityCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.city = nil
        stub.matchType = .city
        XCTAssert(!stub.isValid())
    }
    
    func testStateCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.state = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testStateCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.state = nil
        stub.matchType = .state
        XCTAssert(!stub.isValid())
    }
    
    func testIntersectionCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.intersection = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testIntersectionCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.intersection = nil
        stub.matchType = .intersection
        XCTAssert(!stub.isValid())
    }
    
    func testCountyCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.county = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testCountyCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.county = nil
        stub.matchType = .county
        XCTAssert(!stub.isValid())
    }
    
    func testPostalCodeCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.postalCode = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testPostalCodeCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.postalCode = nil
        stub.matchType = .postalCode
        XCTAssert(!stub.isValid())
    }
    
    func testStreetCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.street = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testStreetCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.street = nil
        stub.matchType = .street
        XCTAssert(!stub.isValid())
    }
    
    func testHouseNumberCanBeEmpty_WhenMatchTypeDoesntMatch() {
        let stub = GeoSuggestion.stub()
        stub.houseNumber = nil
        stub.matchType = .country
        XCTAssert(stub.isValid())
    }
    
    func testHouseNumberCannotBeEmpty_WhenMatchTypeMatches() {
        let stub = GeoSuggestion.stub()
        stub.houseNumber = nil
        stub.matchType = .houseNumber
        XCTAssert(!stub.isValid())
    }
    
    func testDistanceCannotBeNegative() {
        let stub = GeoSuggestion.stub()
        stub.distance = -5
        XCTAssert(!stub.isValid())
    }
    

}
