//
//  LocationDetailPresenter.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain
import RxSwift
import RxCocoa
import RxRelay
import MapKit

class LocationDetailPresenter {
    var detail: GeoSuggestion
    var cells = BehaviorRelay<[TitleSubtitleTableViewCellModel]>(value: [])
    
    var geocodeAddress: GeocodeAddressInteractor
    
    init(detail: GeoSuggestion,
         geocodeAddress: GeocodeAddressInteractor) {
        self.detail = detail
        self.geocodeAddress = geocodeAddress
    }
    
    func configure(disposeBag: DisposeBag)
        ->
        (coordinates: Single<CLLocationCoordinate2D>,
        cells: Driver<[TitleSubtitleTableViewCellModel]>
        ){
            let newcells = self.createCells(for: self.detail, coordinates: nil)
            self.cells.accept(newcells)
            
            return (self.geocode(disposedBy: disposeBag),
                    cells.asDriver()
            )
    }
    
    func geocode(disposedBy disposeBag: DisposeBag) -> Single<CLLocationCoordinate2D> {
        return self.geocodeAddress.execute(for: detail.label)
            .flatMap{[unowned self] result ->  Single<CLLocationCoordinate2D> in
                if let first = result.first {
                    let coordinate = CLLocationCoordinate2D(latitude: first.latitude, longitude: first.longitude)
                    
                    let newcells = self.createCells(for: self.detail, coordinates: coordinate)
                    self.cells.accept(newcells)

                    return Single.just(coordinate)
                }
                return Single.error(LocationError.locationNotFound)
        }
    }
    
    func createCells(for details: GeoSuggestion, coordinates: CLLocationCoordinate2D?) -> [TitleSubtitleTableViewCellModel] {
        var newCells = [TitleSubtitleTableViewCellModel]()
        if let street = self.detail.street {
            newCells.append(TitleSubtitleTableViewCellModel(title: R.string.localizable.location_detail_street(), body: street))
        }
        if let postalCode = self.detail.postalCode {
            newCells.append(TitleSubtitleTableViewCellModel(title: R.string.localizable.location_detail_postalCode(), body: postalCode))
        }
        if let coordinates = coordinates {
            newCells.append(TitleSubtitleTableViewCellModel(title: R.string.localizable.location_detail_coordinates(), body: "\(coordinates.latitude) \(coordinates.longitude)"))
        }
        if let distance = self.detail.distance {
            newCells.append(TitleSubtitleTableViewCellModel(title: R.string.localizable.location_detail_distance(), body: Formatter.createDistanceString(from: distance)))
        }
        return newCells
    }
}

