//
//  NetworkConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Swinject
import ctwTest_Data

class NetworkConfigurator: Assembly {
    func assemble(container: Container) {
        
        container.register(NetworkDispatcher.self, name: "urlsession") { _ in
            return URLSessionClient()
        }
    }
}
