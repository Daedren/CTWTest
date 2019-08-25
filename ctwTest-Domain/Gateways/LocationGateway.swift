//
//  LocationGateway.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift

public protocol LocationGateway {
    func getCurrentLocation() -> Single<[Location]>
}
