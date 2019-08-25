//
//  GatewayConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Swinject
import ctwTest_Data

class GatewayConfigurator: Assembly {
    func assemble(container: Container) {
        let network = container.resolve(NetworkDispatcher.self, name: "urlsession")!

        container.register(GeoSuggestionGatewayImpl.self) { _ in
            return GeoSuggestionGatewayImpl(remoteDataStore:
                network
            )}
        
        container.register(LocationGatewayImpl.self) { _ in
            return LocationGatewayImpl(manager: container.resolve(LocationManager.self)!)
            
        }
    }
}
