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
    
    private let weatherService = NWSWeatherService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        subscribeForecast()
        subscribePointData()
        subscribeObservation()
    }
    
    func onAppear() {
        weatherService.startUpdates()
    }
    
    func refreshData() {
        weatherService.reloadData()
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
}
