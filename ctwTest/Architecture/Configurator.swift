//
//  Configurator.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import UIKit
import Swinject
import ctwTest_Domain

protocol Configurator {
    
}

extension Configurator {
    var assembler: Assembler {
        if let singleton = Assembler.sharedInstance {
            return singleton
        } else {
            let newAssembler = Assembler([NetworkConfigurator(),
                                          StorageConfigurator(),
                                          InterfacesConfigurator(),
                                          GatewayConfigurator(),
                                          InteractorConfigurator()
                ], parent: nil,
                   defaultObjectScope: .container)
            Assembler.sharedInstance = newAssembler
            return newAssembler
        }
    }
}

extension Assembler {
    static var sharedInstance: Assembler?
}
