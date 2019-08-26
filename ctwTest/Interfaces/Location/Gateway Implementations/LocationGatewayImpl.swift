//
//  LocationGatewayImpl.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain
import CoreLocation
import RxSwift

class LocationGatewayImpl: LocationGateway {
    
    var manager: LocationManager
    
    init(manager: LocationManager) {
        self.manager = manager
    }
    
    func getCurrentLocation() -> Single<[Location]> {
        return self.manager.getOneTimeLocation()
            .flatMap{ result -> Single<[Location]> in
                return Single.just(result.map{ Location(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)})
        }
    }
    
    func geocode(address: String) -> Single<[Location]> {
        return self.manager.geocode(address: address)
            .flatMap{ result -> Single<[Location]> in
                if let result = result {
                    return Single.just(result.compactMap{
                        if let location = $0.location {
                            return Location(latitude: location.coordinate.latitude,
                                            longitude: location.coordinate.longitude)
                        }
                        return nil
                    })
                }
                return Single.error(LocationError.locationNotFound)
        }
    }
}

