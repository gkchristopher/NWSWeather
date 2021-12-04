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
    
    let columns = [GridItem(.adaptive(minimum: 120)), GridItem(.adaptive(minimum: 120))]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    if let obs = vm.observation, let station = vm.station {
                        ObservationView(observation: obs, station: station)
                    }
                }
                
                Section {
                    if let tonight = vm.tonightPeriod {
                        ForecastRowView(period: tonight)
                    }
                    if let periods = vm.displayPeriods {
                        LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                            ForEach(periods) { period in
                                CompactForecastRowView(period: period, width: 150)
//                                    .listRowInsets(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                            }
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(vm.title)
            .navigationBarHidden(false)
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "arrow.clockwise.circle")
                        .padding()
                        .onTapGesture {
                            withAnimation(.linear(duration: 2.0)) {
                                vm.refreshData()
                            }
                        }
                        .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0))
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
            .environmentObject(dev.vm)
            .preferredColorScheme(.dark)
    }
}
