//
//  Place.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct PointProperties: Decodable {
    let properties: Point
}

struct Point: Decodable {
    let cwa: String
    let gridX: Int
    let gridY: Int
    let relativeLocation: RelativeLocationProperties
    let forecast: String
    let observationStations: String
}

struct RelativeLocationProperties: Decodable {
    let properties: RelativeLocation
}

struct RelativeLocation: Decodable {
    let city: String
    let state: String
}
