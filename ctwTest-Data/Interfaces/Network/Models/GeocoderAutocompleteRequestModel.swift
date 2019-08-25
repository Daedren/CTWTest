//
//  GeocoderAutocompleteRequestModel.swift
//  ctwTest-Data
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain

struct GeocoderAutocompleteRequestModel: Decodable {
    var prox: String?
    var query: String
    
    init(from model: SuggestionQueryModel) {
        self.query = model.query
        if let location = model.location {
            self.prox = "\(location.latitude),\(location.longitude)"
        }
    }
    
}
