//
//  SuggestionQueryModel.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public class SuggestionQueryModel {
    public var location: Location?
    public var query: String
    
    public init(query: String, location: Location? = nil) {
        self.location = location
        self.query = query
    }
    
    public static func stub() -> SuggestionQueryModel {
        return SuggestionQueryModel(query: "Berlin")
    }
}
