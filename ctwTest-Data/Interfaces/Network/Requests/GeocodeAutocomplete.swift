//
//  GeocodeAutocomplete.swift
//  ctwTest-Data
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

class GeocodeAutocomplete: APIRequest {
    
    var model: GeocoderAutocompleteRequestModel

    init(model: GeocoderAutocompleteRequestModel) {
        self.model = model
    }
    

    public typealias Response = GeocoderAutocompleteResponseModel
    public var path: String {
        return "https://autocomplete.geocoder.api.here.com/6.2/suggest.json"
    }
    public var queryItems: [URLQueryItem]? {
        var items = [URLQueryItem(name: "query", value: model.query)]
        
        if let prox = model.prox {
            items.append(URLQueryItem(name: "prox", value: prox))
        }
        return items
    }
    
    public var method: HTTPMethod {
        return .get
    }
    public var bodyParams: AnyEncodable?
    
}
