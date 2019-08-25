//
//  GetGeoSuggestionFromQueryInteractor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift

public class GetGeoSuggestionFromQueryInteractor: Interactor {
    typealias Input = SuggestionQueryModel
    typealias Output = Single<[GeoSuggestion]>
    
    public var gateway: GeoSuggestionGateway
    
    public init(gateway: GeoSuggestionGateway) {
        self.gateway = gateway
    }
    
    public func execute(for input: SuggestionQueryModel) -> Single<[GeoSuggestion]> {
        let suggestions = gateway
            .getSuggestionFrom(query: input)
        
        if input.location != nil {
            return suggestions.flatMap{ result in
                return Single.just(result.sorted(by: {
                    return $0.distance ?? 0.0 < $1.distance ?? 0.0
                }))
                
            }
        }
        else {
            return suggestions
        }
        
    }
    
}
