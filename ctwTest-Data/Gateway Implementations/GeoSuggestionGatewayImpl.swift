//
//  GeoSuggestionGatewayImpl.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain
import RxSwift

public class GeoSuggestionGatewayImpl: GeoSuggestionGateway {
    public var remoteDataStore: NetworkDispatcher
    
    public init(remoteDataStore: NetworkDispatcher) {
        self.remoteDataStore = remoteDataStore
    }

    
    public func getSuggestionFrom(query: SuggestionQueryModel) -> Single<[GeoSuggestion]> {
        let requestModel = GeocoderAutocompleteRequestModel(from: query)
        return remoteDataStore.execute(request: GeocodeAutocomplete(model: requestModel))
            .flatMap{ result -> Single<[GeoSuggestion]> in
                var addresses = [GeoSuggestion]()
                for suggestion in result.suggestions {
                    guard let entity = suggestion.mapToEntity() else {return Single.error(DomainError.entityMappingError)}
                    
                    addresses.append(entity)
                }
                return Single.just(addresses)
        }
    }

}
