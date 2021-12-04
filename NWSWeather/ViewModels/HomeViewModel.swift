//
//  ViewModel.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Combine
import Foundation

class HomeViewModel: ObservableObject {
    @Published var point: Point?
    @Published var forecast: Forecast?
    @Published var observation: Observation?
    @Published var station: ObservationStation?
    @Published var isLoading = false
    
    @Published var tonightPeriod: Period?
    @Published var displayPeriods: [Period]?
    
    private let weatherService = NWSWeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    var title: String {
        guard let location = point?.relativeLocation.properties else {
            return "Current Weather"
        }
        return "\(location.city), \(location.state)"
    }
    
    init() {
        subscribeForecast()
        subscribePointData()
        subscribeObservation()
    }
    
    func onAppear() {
        weatherService.startUpdates()
        isLoading = true
    }
    
    func refreshData() {
        weatherService.reloadData()
        isLoading = true
    }
    
    func subscribePointData() {
        weatherService.$point
            .sink(receiveValue: { [weak self] newPoint in
                guard let newPoint = newPoint else { return }
                self?.point = newPoint
            })
            .store(in: &cancellables)
    }
    
    func subscribeForecast() {
        weatherService.$forecast
            .sink { [weak self] forecast in
                self?.forecast = forecast
                self?.processForecast(forecast)
                self?.isLoading = false
                print("Forecast updated")
            }
            .store(in: &cancellables)
    }
    
    func subscribeObservation() {
        weatherService.$observation
            .combineLatest(weatherService.$observationStation)
            .sink { [weak self] obs, station in
                self?.observation = obs
                self?.station = station
            }
            .store(in: &cancellables)
    }
    
    private func processForecast(_ forecast: Forecast?) {
        guard let forecast = forecast else { return }

        var periods = forecast.periods
        if !periods[0].isDaytime {
            tonightPeriod = periods[0]
            periods.remove(at: 0)
        }
        
        displayPeriods = periods
    }
}
