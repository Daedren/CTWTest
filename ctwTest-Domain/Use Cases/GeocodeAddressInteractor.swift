//
//  GeocodeAddressInteractor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift

public class GeocodeAddressInteractor: Interactor {
    typealias Input = String
    typealias Output = Single<[Location]>
    
    public var gateway: LocationGateway
    
    public init(gateway: LocationGateway) {
        self.gateway = gateway
    }
    
    public func execute(for input: String) -> Single<[Location]> {
        return gateway.geocode(address: input)
    }
    
}
