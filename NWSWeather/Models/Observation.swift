//
//  Observation.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct ObservationProperties: Decodable {
    let properties: Observation
}

struct Observation: Decodable {
    let textDescription: String
    let temperature: ObservationUnit
    let windSpeed: ObservationUnit
    let windDirection: ObservationUnit
}

struct ObservationUnit: Decodable {
    let unitCode: String
    let value: Double?
}

struct ObservationStationResponse: Decodable {
    let features: [ObservationStationProperties]
    let observationStations: [String]
}

struct ObservationStationProperties: Decodable {
    let properties: ObservationStation
}

struct ObservationStation: Decodable {
    let name: String
    let stationIdentifier: String
}
