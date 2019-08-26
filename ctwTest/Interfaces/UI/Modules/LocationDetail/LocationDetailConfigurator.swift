//
//  LocationDetailConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import ctwTest_Domain

class LocationDetailConfigurator: Configurator {
    
    func configure(for detail: GeoSuggestion) -> LocationDetailViewController {
        let view = LocationDetailViewController(nib: R.nib.locationDetailView)
        view.presenter = self.inject().resolve(LocationDetailPresenter.self, argument: detail)
        return view
    }
    
    private func inject() -> Container {
        return Container { container in

            container.register(LocationDetailPresenter.self) { (_, detail: GeoSuggestion) in
                
                let presenter = LocationDetailPresenter(
                    detail: detail,
                    geocodeAddress: self.assembler.resolver.resolve(GeocodeAddressInteractor.self)!
                )
                return presenter
            }
            
        }
    }
}
