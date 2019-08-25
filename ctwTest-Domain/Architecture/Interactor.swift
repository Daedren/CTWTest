//
//  Interactor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

protocol Interactor {
    associatedtype Input
    associatedtype Output
    func execute(for input: Input) -> Output
}

protocol InteractorNoInput {
    associatedtype Output
    func execute() -> Output
}
