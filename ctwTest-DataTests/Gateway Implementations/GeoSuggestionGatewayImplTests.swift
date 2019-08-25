//
//  GeoSuggestionGatewayImplTests.swift
//  ctwTest-DataTests
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import XCTest
import Cuckoo
import ctwTest_Domain
import RxSwift
import RxBlocking
@testable import ctwTest_Data

extension GeocodeAutocomplete: Matchable {
    public typealias MatchedType = GeocodeAutocomplete
    public var matcher: ParameterMatcher<GeocodeAutocomplete> {
        return ParameterMatcher { $0.path == self.path}
    }
}


extension SuggestionQueryModel: Matchable {
    public typealias MatchedType = SuggestionQueryModel
    public var matcher: ParameterMatcher<SuggestionQueryModel> {
        return ParameterMatcher { $0.query == self.query}
    }
}


extension GeocoderAutocompleteRequestModel: Matchable {
    public typealias MatchedType = GeocoderAutocompleteRequestModel
    public var matcher: ParameterMatcher<GeocoderAutocompleteRequestModel> {
        return ParameterMatcher { $0.query == self.query}
    }
}

class GeoSuggestionGatewayImplTests: XCTestCase {
    

    
    func testGetSuggestion() {
        let mockG = MockNetworkDispatcher()
        
        let requestModel = GeocoderAutocompleteRequestModel(from: SuggestionQueryModel.stub())
        let request = GeocodeAutocomplete(model: requestModel)
        
        let response = GeocoderAutocompleteResponseModel.stub()
        
        stub(mockG) { stub in
            when(stub.execute(request: request)).then { _ in
                return Single.just(response)
            }
        }
        
        let gateway = GeoSuggestionGatewayImpl(remoteDataStore: mockG)
        let result = gateway.getSuggestionFrom(query: SuggestionQueryModel.stub())
        
        do {
            let blocking = try result.toBlocking(timeout: 5).first()
            XCTAssertTrue(blocking?.first != nil, "An unexpected empty emission")
        } catch {
            XCTFail("No value was returned from the gateway")
        }

        
    }
}

