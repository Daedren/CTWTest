//
//  APIRequest.swift
//  ctwTest
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get, post, put, patch, delete, head
}

public protocol APIRequest {
    associatedtype Response: Decodable
    var path: String { get }
    var method: HTTPMethod { get }
    var bodyParams: AnyEncodable? { get }
    var queryItems: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
}

extension APIRequest {
    public var method: HTTPMethod { return .get }
    public var bodyParams: AnyEncodable? { return nil }
    public var queryItems: [URLQueryItem]? { return nil }
    public var headers: [String: String]? { return nil }
}

public struct AnyEncodable: Encodable {
    let value: Encodable
    
    public func encode(to encoder: Encoder) throws {
        try self.value.encode(to: encoder)
    }
}
