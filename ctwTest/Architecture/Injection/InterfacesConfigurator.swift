//
//  InterfacesConfigurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import Swinject

class InterfacesConfigurator: Assembly {
    func assemble(container: Container) {
        
        container.register(LocationManager.self) { _ in
            return LocationManager()
        }
    }
}
