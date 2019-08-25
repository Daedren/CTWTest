//
//  LocationListWireframe.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

class LocationListWireframe: Wireframe {
    typealias ViewType = LocationListViewController
    var source: LocationListViewController
    
    init(view: LocationListViewController) {
        self.source = view
    }
}
