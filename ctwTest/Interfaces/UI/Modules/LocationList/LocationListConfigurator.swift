//
//  LocationListConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import ctwTest_Domain

class LocationListConfigurator: Configurator {
    
    func configure() -> LocationListViewController {
        let view = LocationListViewController(nib: R.nib.locationListView)
        view.presenter = self.inject().resolve(LocationListPresenter.self, argument: view)
        return view
    }
    
    private func inject() -> Container {
        return Container { container in
            container.register(LocationListWireframe.self) { (_, viewController: LocationListViewController) in
                return LocationListWireframe(view: viewController)
            }
            
            container.register(LocationListPresenter.self) { (_, viewController: LocationListViewController) in
                
                let presenter = LocationListPresenter(
                    router: container.resolve(LocationListWireframe.self, argument: viewController)!,
                    getLocation: self.assembler.resolver.resolve(GetCurrentLocationInteractor.self)!,
                    getAddress: self.assembler.resolver.resolve(GetGeoSuggestionFromQueryInteractor.self)!
                    
                )
                return presenter
            }
            
        }
    }
}
