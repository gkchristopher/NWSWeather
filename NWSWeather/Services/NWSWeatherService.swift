//
//  NWSWeatherApi.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Foundation
import Combine
import CoreLocation

class NWSWeatherService {
    
    @Published var point: Point?
    @Published var forecast: Forecast?
    
    private let locationManager = LocationManager()
    private var pointSubscription: AnyCancellable?
    private var forecastSubscription: AnyCancellable?
    private var locationSubscription: AnyCancellable?
    private var cancellables = Set<AnyCancellable>()
    
    private static let baseUrl = "https://api.weather.gov/"
    
    init() {
        addSubscribers()
    }
    
    func startUpdates() {
        locationManager.requestLocation()
    }
    
    func addSubscribers() {
        locationManager.$location
            .debounce(for: .seconds(0.2), scheduler: DispatchQueue.main)
            .sink { [weak self] location in
                print("Location subscription fired.")
                guard let self = self,
                      let location = location else { return }
                self.getPoint(at: location)
            }
            .store(in: &cancellables)
    }
    
    func getPoint(at coordinate: CLLocationCoordinate2D) {
        guard var url = URL(string: NWSWeatherService.baseUrl) else { return }
        
        url.appendPathComponent("points")
        url.appendPathComponent("\(coordinate.latitude),\(coordinate.longitude)")
        
        NetworkingManager.download(url: url)
            .decode(type: PointProperties.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] pointProperties in
                self?.point = pointProperties.properties
                self?.getForecast(for: pointProperties.properties)
            })
            .store(in: &cancellables)
    }
    
    func getForecast(for point: Point) {
        guard var url = URL(string: NWSWeatherService.baseUrl) else { return }
        
        url.appendPathComponent("gridpoints")
        url.appendPathComponent(point.cwa)
        url.appendPathComponent("\(point.gridX),\(point.gridY)")
        url.appendPathComponent("forecast")
        
        NetworkingManager.download(url: url)
            .decode(type: Forecast.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] forecast in
                self?.forecast = forecast
            })
            .store(in: &cancellables)
    }
}
