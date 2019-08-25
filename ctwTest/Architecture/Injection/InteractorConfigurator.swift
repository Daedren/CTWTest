//
//  InteractorConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import Swinject
import ctwTest_Domain
import ctwTest_Data

class InteractorConfigurator: Assembly {
    func assemble(container: Container) {
        
        container.register(GetGeoSuggestionFromQueryInteractor.self) { _ in
            return GetGeoSuggestionFromQueryInteractor(gateway:
                container.resolve(GeoSuggestionGatewayImpl.self)!
        )}
       container.register(GetCurrentLocationInteractor.self) { _ in
            return GetCurrentLocationInteractor(gateway:
                container.resolve(LocationGatewayImpl.self)!
        )}
    }
}
