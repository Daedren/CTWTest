//
//  LocationTableViewCellModel.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain

struct LocationTableViewCellModel {
    public var main: String
    public var sub: String
    public var caption: String
    
    init(from suggestion: GeoSuggestion) {
        main = suggestion.label
        sub = suggestion.country
        
        if let distance = suggestion.distance, distance >= 0.0 {
            
            let distanceString = Formatter.createDistanceString(from: distance)
            caption = R.string.localizable.location_cell_distance(distanceString)
        }
        else {
            caption = R.string.localizable.location_cell_distance("--")
        }
    }
    
}
