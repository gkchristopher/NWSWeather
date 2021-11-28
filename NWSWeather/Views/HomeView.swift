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
                        Text("\(point.relativeLocation.properties.city), \(point.relativeLocation.properties.state)")
                        Text("Office: \(point.cwa)")
                        Text("GridX: \(point.gridX)")
                        Text("GridY: \(point.gridY)")
                    }
                }
                
                Section(header: Text("Forecast")) {
                    if let forecast = vm.forecast {
                        ForEach(forecast.periods) { period in
                            VStack(alignment: .leading, spacing: 4) {
                                HStack {
                                    Text(period.name)
                                        .font(.headline)
                                    Spacer()
                                    Text("\(period.temperature)°")
                                        .font(.headline)
                                        .foregroundColor(.theme.blue)
                                }
                                Text(period.shortForecast)
                                    .foregroundColor(.theme.green)
                                Text(period.detailedForecast)
                                    .font(.caption)
                                    .foregroundColor(.theme.green)
                            }
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
                            vm.startUpdates()
                        }
                }
            })
            .onAppear {
                vm.startUpdates()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(HomeViewModel())
    }
}

//extension HomeView {
//
//    private var forecastRowView: some View {
//        VStack(alignment: .leading, spacing: 4) {
//            HStack {
//                Text(period.name)
//                    .font(.headline)
//                Spacer()
//                Text("\(period.temperature)°")
//                    .font(.headline)
//                    .foregroundColor(.theme.blue)
//            }
//            Text(period.shortForecast)
//                .foregroundColor(.theme.green)
//            Text(period.detailedForecast)
//                .font(.caption)
//                .foregroundColor(.theme.green)
//        }
//    }
//}
