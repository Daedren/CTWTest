//
//  GeoSuggestion.swift
//  ctwTest-Domain
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation

public class GeoSuggestion: Entity {
    public var label: String
    public var country: String
    public var state: String?
    public var county: String?
    public var city: String?
    public var district: String?
    public var street: String?
    public var houseNumber: Int?
    public var intersection: String?
    public var postalCode: String?
    public var distance: Double?
    
    public var matchType: GeoSuggestionMatchType
    
    public init(
        label: String,
        country: String,
        state: String?,
        county: String?,
        city: String?,
        district: String?,
        street: String?,
        houseNumber: Int?,
        intersection: String?,
        postalCode: String?,
        distance: Double?,
        matchType: GeoSuggestionMatchType) {
        self.label = label
        self.country = country
        self.state = state
        self.county = county
        self.city = city
        self.district = district
        self.street = street
        self.houseNumber = houseNumber
        self.intersection = intersection
        self.postalCode = postalCode
        self.distance = distance
        self.matchType = matchType
    }
    
    // Suggestions have a MatchType which refers to the granularity of the result. If the matchType is something specific like "Street", all of the less specific variables must be filled.
    public func isValid() -> Bool {
        return
            (!label.isEmpty)
                && (!country.isEmpty)
                && ((city != nil && !city!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.city.rawValue)
                && ((state != nil && !state!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.state.rawValue)
                && ((intersection != nil && !intersection!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.intersection.rawValue)
                && ((county != nil && !county!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.county.rawValue)
                && ((postalCode != nil && !postalCode!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.postalCode.rawValue)
                && ((street != nil && !street!.isEmpty) || matchType.rawValue > GeoSuggestionMatchType.street.rawValue)
                && (houseNumber != nil || matchType.rawValue > GeoSuggestionMatchType.houseNumber.rawValue)
                && (distance != nil && distance! >= 0.0)
    }
    
    
    static func stub() -> GeoSuggestion {
        return GeoSuggestion(
            label: "Deutschland, Frankfurt am Main, Berliner Straße",
            country: "Deutschland",
            state: "Berlin",
            county: "Berlin",
            city: "Berlin",
            district: "Mitte",
            street: "Pariser Platz",
            houseNumber: nil,
            intersection: nil,
            postalCode: "10117",
            distance: 1337,
            matchType: .street)
    }
    
}

public enum GeoSuggestionMatchType: Int {
    case houseNumber
    case intersection
    case street
    case postalCode
    case district
    case city
    case county
    case state
    case country
    
}
