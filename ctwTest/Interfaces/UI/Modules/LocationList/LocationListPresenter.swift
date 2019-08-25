//
//  LocationListPresenter.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain
import RxSwift
import RxRelay
import RxCocoa

class LocationListPresenter {
    
    var router: LocationListWireframe
    var getLocation: GetCurrentLocationInteractor
    var getAddress: GetGeoSuggestionFromQueryInteractor
    
    var cells = BehaviorRelay<[LocationTableViewCellModel]>(value: [])
    var currentLocation: Location?
    
    init(router: LocationListWireframe,
         getLocation: GetCurrentLocationInteractor,
         getAddress: GetGeoSuggestionFromQueryInteractor) {
        self.router = router
        self.getAddress = getAddress
        self.getLocation = getLocation
    }
    
    func configure(
        searchText: Observable<String?>,
        disposeBag: DisposeBag) ->
        (Driver<[LocationTableViewCellModel]>){
            
            searchText.subscribe(onNext: { [weak self] nextText in
                self?.getSuggestions(for: nextText, disposedBy: disposeBag)
            }).disposed(by: disposeBag)
            
            getLocation.execute()
                .subscribe(onSuccess: { [weak self] nextLocation in
                    // The first location is the most current one
                    self?.currentLocation = nextLocation.first
                }, onError: { err in
                    
                }).disposed(by: disposeBag)

            return cells.asDriver()
    }
    
    func getSuggestions(for query: String?, disposedBy disposeBag: DisposeBag) {
        guard let query = query else {
            self.cells.accept([])
            return
        }
        
        let model = SuggestionQueryModel(query: query, location: self.currentLocation)
        getAddress.execute(for: model)
            .subscribe(onSuccess: { [weak self] suggestions in
                var newCells = [LocationTableViewCellModel]()
                for address in suggestions {
                    let model = LocationTableViewCellModel(from: address)
                    newCells.append(model)
                }
                self?.cells.accept(newCells)
            },
                       onError: { err in
                        
            }).disposed(by: disposeBag)
        }

    
}
