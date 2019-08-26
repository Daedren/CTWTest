//
//  LocationListWireframe.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain

class LocationListWireframe: Wireframe {
    typealias ViewType = LocationListViewController
    var source: LocationListViewController
    
    init(view: LocationListViewController) {
        self.source = view
    }
    
    // Entities really shouldn't be tossed around like this.
    // Instead the parameter should be an unique identifier and a use case would then provide the Presenter with what it wants.
    // But for brevity's sake ..
    func goToDetail(of detail: GeoSuggestion) {
        let viewc = LocationDetailConfigurator().configure(for: detail)
        self.present(viewController: viewc)
    }
}
