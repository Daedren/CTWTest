//
//  StorageConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import Swinject

class StorageConfigurator: Assembly {
    func assemble(container: Container) {
        
        //        container.register(NetworkDispatcher.self, name: "urlsession") { _ in
        //            return URLSessionClient(baseEndpoint: "https://www.atlantico.eu")!
        //        }
        //
        //        container.register(NetworkDispatcher.self, name: "mockclient") { _ in
        //            return MockClient()
        //        }
    }
}
