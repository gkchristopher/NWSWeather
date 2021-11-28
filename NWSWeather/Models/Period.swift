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
    let shortForecast: String
    let detailedForecast: String
    
    static var emptyPeriod: Period = {
        Period(id: 1, name: "None", temperature: 0, shortForecast: "No forecast", detailedForecast: "No forecast")
    }()
    
    enum CodingKeys: String, CodingKey {
        case id = "number"
        case name
        case temperature
        case shortForecast
        case detailedForecast
    }
}
