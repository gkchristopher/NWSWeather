//
//  ContentView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Point metadata")) {
                    if let point = vm.point {
                        PointMetadataView(point: point)
                    }
                }
                
                Section(header: Text("Observation")) {
                    if let obs = vm.observation, let station = vm.station {
                        ObservationView(observation: obs, station: station)
                    }
                }
                
                Section(header: Text("Forecast")) {
                    if let forecast = vm.forecast {
                        ForEach(forecast.periods) { period in
                            ForecastRowView(period: period)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("NWS Weather API")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "goforward")
                        .onTapGesture {
                            vm.refreshData()
                        }
                }
            })
            .onAppear {
                vm.onAppear()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
            .preferredColorScheme(.dark)
    }
}
