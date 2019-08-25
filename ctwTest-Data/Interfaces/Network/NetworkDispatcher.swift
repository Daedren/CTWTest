//
//  NetworkDispatcher.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import RxSwift

public protocol NetworkDispatcher {
    func execute<T: APIRequest>(request: T) -> Single<T.Response>
}


