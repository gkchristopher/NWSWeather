//
//  PreviewProvider.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        DeveloperPreview.instance
    }
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    
    private init() {}
    
    let vm = HomeViewModel()
    
    let point = Point(cwa: "ABC", gridX: 42, gridY: 69, relativeLocation: RelativeLocationProperties(properties: RelativeLocation(city: "Hometown", state: "USA")), forecast: "Clammy", observationStations: "KEYW")
    
    let station = ObservationStation(name: "Key West, FL", stationIdentifier: "KEYW")
    let observation = Observation(textDescription: "Clear",
                                  temperature: ObservationUnit(unitCode: "C", value: 27),
                                  windSpeed: ObservationUnit(unitCode: "kph", value: 12),
                                  windDirection: ObservationUnit(unitCode: "angle", value: 20),
                                  timestamp: Date())
    
    let period1 = Period(id: 1, name: "Tonight", temperature: 32, temperatureTrend: nil, shortForecast: "Clear", detailedForecast: "Clear skies!!", windDirection: "N", windSpeed: "5 mph", icon: "https://api.weather.gov/icons/land/day/skc", isDaytime: true)
    let period2 = Period(id: 2, name: "Today", temperature: 99, temperatureTrend: nil, shortForecast: "Hot", detailedForecast: "Head for the AC", windDirection: "N", windSpeed: "5 mph", icon: "https://api.weather.gov/icons/land/day/skc", isDaytime: true)
}
