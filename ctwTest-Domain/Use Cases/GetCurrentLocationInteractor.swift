//
//  GetCurrentLocationInteractor.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift

public class GetCurrentLocationInteractor: InteractorNoInput {
    typealias Output = Single<[Location]>
    
    public var gateway: LocationGateway
    
    public init(gateway: LocationGateway) {
        self.gateway = gateway
    }
    
    public func execute() -> Single<[Location]> {
        return gateway.getCurrentLocation()
    }
    
}
