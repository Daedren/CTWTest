//
//  LocationManager.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain
import CoreLocation
import RxRelay
import RxSwift

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    var manager = CLLocationManager()
    var locations = PublishSubject<[CLLocation]>()

    func initManager() throws {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined {
            manager.requestWhenInUseAuthorization()
        }
        else if authorizationStatus == .restricted || authorizationStatus == .denied {
            throw LocationError.notAuthorized
        } else if !CLLocationManager.locationServicesEnabled() {
            throw LocationError.notAvailable
        }
        
        manager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        manager.distanceFilter = 100.0  // In meters.
        manager.delegate = self
    }
    
    public func getOneTimeLocation() -> Single<[CLLocation]> {
        do {
            try self.initManager()
            manager.requestLocation()
            return locations.asSingle()
        }
        catch let err {
            return Single.error(err)
        }
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.locations.onNext(locations)
        self.locations.onCompleted()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locations.onError(error)
        
    }
    
}
