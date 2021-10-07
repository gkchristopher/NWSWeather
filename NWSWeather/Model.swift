//
//  Model.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Combine

class Model: ObservableObject {
    @Published var point: Point = Point(office: "None", gridX: 0, gridY: 0)
    
    private let api = NWSWeatherApi()
    
    func loadPointMetadata() {
        api.fetchMetadata(for: Coordinate(latitude: 35.7346, longitude: -86.6053)) { point in
            self.point = point
        }
    }
}
