//
//  Forecast.swift
//  NWSWeather
//
//  Created by Christopher Moore on 10/7/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct ForecastProperties: Decodable {
    let properties: Forecast
}

struct Forecast: Decodable {
    let updated: String
    let periods: [Period]
}


