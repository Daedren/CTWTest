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

}

