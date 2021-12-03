//
//  NWSWeatherApp.swift
//  NWSWeather
//
//  Created by Christopher Moore on 12/3/21.
//

import SwiftUI

@main
struct NWSWeatherApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(viewModel)
        }
    }
}
