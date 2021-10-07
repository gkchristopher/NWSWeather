//
//  NWSWeatherApi.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct NWSWeatherApi {
    private let baseUrl = "https://api.weather.gov/"
    
    func fetchMetadata(for coordinate: Coordinate, completion: @escaping (Point) -> Void) {
        let request = URLRequest(url: URL(string: baseUrl + "points/\(coordinate.latitude),\(coordinate.longitude)")!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Point.self, from: data) {
                    DispatchQueue.main.async {
                        completion(decodedResponse)
                    }
                    return
                }
            }
        }.resume()
    }
}
