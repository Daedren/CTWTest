//
//  GeocoderAutocompleteResponseModel.swift
//  ctwTest-Data
//
//  Created by Ricardo Moreira on 24/08/2019.
//  Copyright © 2019 RKM. All rights reserved.
//

import Foundation
import ctwTest_Domain

struct GeocoderAutocompleteResponseModel: Decodable {
    var suggestions: [GeocoderAutocompleteSuggestions]
    
    public static func stub() -> GeocoderAutocompleteResponseModel {
        return GeocoderAutocompleteResponseModel(suggestions: [GeocoderAutocompleteSuggestions.stub()])
    }
    
}

struct GeocoderAutocompleteSuggestions: Decodable {
    var label: String
    var language: String
    var countryCode: String
    var locationId: String
    var address: GeocoderAutocompleteAddress
    var distance: Double?
    var matchLevel: String
    
    func mapToEntity() -> GeoSuggestion? {
        let houseNumber = Int(self.address.houseNumber ?? "")
        
        var matchType: GeoSuggestionMatchType?
        switch matchLevel {
        case "houseNumber":
            matchType = GeoSuggestionMatchType.houseNumber
        case "intersection":
            matchType = GeoSuggestionMatchType.intersection
        case "street":
            matchType = GeoSuggestionMatchType.street
        case "postalCode":
            matchType = GeoSuggestionMatchType.postalCode
        case "district":
            matchType = GeoSuggestionMatchType.district
        case "city":
            matchType = GeoSuggestionMatchType.city
        case "county":
            matchType = GeoSuggestionMatchType.county
        case "state":
            matchType = GeoSuggestionMatchType.state
        case "country":
            matchType = GeoSuggestionMatchType.country
        default:
            break
        }
        
        guard let matchLevel = matchType else {return nil}
        
        let address = GeoSuggestion(
            label: self.label,
            country: self.address.country,
            state: self.address.state,
            county: self.address.county,
            city: self.address.city,
            district: self.address.district,
            street: self.address.street,
            houseNumber: houseNumber,
            intersection: self.address.intersection,
            postalCode: self.address.postalCode,
            distance: self.distance,
            matchType: matchLevel)
        
        
        if !address.isValid() {
            return nil
        }
        
        return address
    }
    
    public static func stub() -> GeocoderAutocompleteSuggestions {
        return GeocoderAutocompleteSuggestions(
            label: "Deutschland, Frankfurt am Main, Berliner Straße",
            language: "en",
            countryCode: "GER",
            locationId: "NT_code",
            address: GeocoderAutocompleteAddress.stub(),
            distance: 1.0,
            matchLevel: "street")
    }
}

struct GeocoderAutocompleteAddress: Decodable {
    var country: String
    var state: String?
    var county: String?
    var city: String?
    var district: String?
    var street: String?
    var intersection: String?
    var houseNumber: String?
    var postalCode: String?
    
    public static func stub() -> GeocoderAutocompleteAddress {
        return GeocoderAutocompleteAddress(
            country: "Deutschland",
            state: "Berlin",
            county: "Berlin",
            city: "Berlin",
            district: "Mitte",
            street: "Pariser Platz",
            intersection: nil,
            houseNumber: nil,
            postalCode: "10117")
    }
}
