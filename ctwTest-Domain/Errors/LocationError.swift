//
//  LocationError.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public enum LocationError: Error, Equatable {
    case deinitialized
    case notAuthorized
    case notAvailable
}
