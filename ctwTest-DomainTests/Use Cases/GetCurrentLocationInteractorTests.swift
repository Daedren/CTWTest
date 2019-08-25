//
//  GetCurrentLocationInteractorTests.swift
//  ctwTest-DomainTests
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import XCTest
import Cuckoo
import RxSwift
import RxBlocking
@testable import ctwTest_Domain


class GetCurrentLocationInteractorTests: XCTestCase {
    
    func testGetCurrentLocation_Valid() {
        let mockG = MockLocationGateway()
        stub(mockG) { stub in
            when(stub.getCurrentLocation()).then { _ in
                return Single.just([Location(latitude: -2, longitude: -2)])
            }
        }
        
        let interactor = GetCurrentLocationInteractor(gateway: mockG)
        let address = interactor.execute()
        
        do {
            let blocking = try address.toBlocking(timeout: 5).first()
            XCTAssertFalse(blocking?.isEmpty ?? true, "No results were returned from the interactor")
        } catch {
            XCTFail("No value was returned from the gateway")
        }
    }
    
    func testGetCurrentLocation_StandardError() {
        var error: Error?
        let mockG = MockLocationGateway()
        stub(mockG) { stub in
            when(stub.getCurrentLocation()).then { _ in
                return Single.error(LocationError.notAuthorized)
            }
        }
        
        let interactor = GetCurrentLocationInteractor(gateway: mockG)
        let address = interactor.execute()

        
        XCTAssertThrowsError(try address.toBlocking(timeout: 5).first()) {
            error = $0
        }
        XCTAssertTrue(error is LocationError, "Unexpected error type: \(type(of: error))")
        XCTAssertEqual(error as? LocationError, LocationError.notAuthorized)
    }
    
}
