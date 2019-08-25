//
//  GeocoderAutocompleteResponseModelTests.swift
//  ctwTest-DataTests
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import XCTest
@testable import ctwTest_Data

class GeocoderAutocompleteResponseModelTests: XCTestCase {
    
    func testMapGeocoderSuggestions_Valid(){
        let suggestion = GeocoderAutocompleteSuggestions.stub()
        XCTAssertNotNil(suggestion.mapToEntity())
    }
    
    func testMapGeocoderSuggestions_InvalidEntity(){
        var suggestion = GeocoderAutocompleteSuggestions.stub()
        suggestion.address.street = ""
        suggestion.matchLevel = "street"
        XCTAssertNil(suggestion.mapToEntity())
    }
    
    func testMapGeocoderSuggestions_EntityMapping(){
        let suggestion = GeocoderAutocompleteSuggestions.stub()
        let entity = suggestion.mapToEntity()
        XCTAssertTrue(entity?.city == suggestion.address.city)
        XCTAssertTrue(entity?.county == suggestion.address.county)
        XCTAssertTrue(entity?.district == suggestion.address.district)
        XCTAssertTrue(entity?.street == suggestion.address.street)
        XCTAssertTrue(entity?.postalCode == suggestion.address.postalCode)
        XCTAssertTrue(entity?.country == suggestion.address.country)
        XCTAssertTrue(entity?.houseNumber == Int(suggestion.address.houseNumber ?? ""))
        XCTAssertTrue(entity?.intersection == suggestion.address.intersection)
        XCTAssertTrue(entity?.matchType == .street)
    }
}
