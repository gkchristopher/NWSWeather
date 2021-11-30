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
    @Published var observation: Observation?
    @Published var observationStation: ObservationStation?
    
    private let locationManager = LocationManager()
    private var timer: Timer?
    private var cancellables = Set<AnyCancellable>()
    
    private static let baseUrl = "https://api.weather.gov/"
    
    init() {
        addSubscribers()
    }
    
    func startUpdates() {
        if locationManager.location == nil {
            locationManager.requestLocation()
        } else if let point = point {
            getForecast(for: point)
        }
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
                guard let self = self else { return }
                self.point = pointProperties.properties
                self.getForecast(for: pointProperties.properties)
                self.getObservationStations(urlString: pointProperties.properties.observationStations)
            })
            .store(in: &cancellables)
    }
    
    func getForecast(for point: Point) {
        guard let url = URL(string: point.forecast) else { return }
        
        timer?.invalidate()
        
        NetworkingManager.download(url: url)
            .decode(type: ForecastProperties.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] value in
                self?.forecast = value.properties
                self?.timer = Timer.scheduledTimer(withTimeInterval: 60.0 * 5, repeats: true) { _ in
                    self?.getForecast(for: point)
                }
            })
            .store(in: &cancellables)
    }
    
    func getObservationStations(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: ObservationStationResponse.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] stations in
                if let station = stations.features.first {
                    self?.observationStation = station.properties
                    self?.getObservation(for: station.properties.stationIdentifier)
                }
            })
            .store(in: &cancellables)
    }
    
    func getObservation(for stationID: String) {
        guard let url = URL(string: "https://api.weather.gov/stations/\(stationID)/observations/latest") else { return }
        
        NetworkingManager.download(url: url)
            .decode(type: ObservationProperties.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] value in
                self?.observation = value.properties
            })
            .store(in: &cancellables)
    }
}
