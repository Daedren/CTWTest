//
//  APIError.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 25/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public enum APIError: Error, Equatable {
    case httpError(code: Int, message: String)
    case requestTimedOut
    case noInternet
    case invalidCertificate
    case jsonParsingError
    case mockNotFound
    case cannotMapToEntity
    case unsuccessfulResponse
    case otherError
}
