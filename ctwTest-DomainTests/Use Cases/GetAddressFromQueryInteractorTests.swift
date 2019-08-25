//
//  GetGeoSuggestionFromQueryInteractorTests.swift
//  ctwTest-DomainTests
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import XCTest
import Cuckoo
import RxSwift
import RxBlocking
@testable import ctwTest_Domain

extension SuggestionQueryModel: Matchable {
    public typealias MatchedType = SuggestionQueryModel
    public var matcher: ParameterMatcher<SuggestionQueryModel> {
        return ParameterMatcher { $0.query == self.query}
    }
}

class GetGeoSuggestionFromQueryInteractorTests: XCTestCase {
    
    func testGetSuggestionFromQuery_Success() {
        let mockG = MockGeoSuggestionGateway()
        let query = SuggestionQueryModel.stub()
        stub(mockG) { stub in
            when(stub.getSuggestionFrom(query: query)).then { _ in
                return Single.just([GeoSuggestion.stub()])
            }
        }
        
        let interactor = GetGeoSuggestionFromQueryInteractor(gateway: mockG)
        let address = interactor.execute(for: query)
        
        do {
            let blocking = try address.toBlocking(timeout: 5).first()
            let firstItem = blocking?.first
            XCTAssertTrue(firstItem?.isValid() ?? false, "The returned entity isn't valid")
        } catch {
            XCTFail("No value was returned from the gateway")
        }
    }
    
    func testGetSuggestionFromQuery_FailWithError() {
        var error: Error?
        let mockG = MockGeoSuggestionGateway()
        let query = SuggestionQueryModel.stub()
        stub(mockG) { stub in
            when(stub.getSuggestionFrom(query: query)).then { _ in
                return Single.error(APIError.noInternet)
            }
        }
        
        let interactor = GetGeoSuggestionFromQueryInteractor(gateway: mockG)
        let address = interactor.execute(for: query)
        
        
        XCTAssertThrowsError(try address.toBlocking(timeout: 5).first()) {
           error = $0
        }
        XCTAssertTrue(error is APIError, "Unexpected error type: \(type(of: error))")
        XCTAssertEqual(error as? APIError, APIError.noInternet)
    }

}
