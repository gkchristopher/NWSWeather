//
//  Period.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/27/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct Period: Identifiable, Decodable {
    let id: Int
    let name: String
    let temperature: Int
    let temperatureTrend: String?
    let shortForecast: String
    let detailedForecast: String
    let windDirection: String
    let windSpeed: String
    let icon: String
    let isDaytime: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "number"
        case name
        case temperature
        case temperatureTrend
        case shortForecast
        case detailedForecast
        case windDirection
        case windSpeed
        case icon
        case isDaytime
    }
}
