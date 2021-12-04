//
//  ObservationView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/29/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct ObservationView: View {
    
    let observation: Observation
    let station: ObservationStation
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Current conditions at " + station.name + " (\(station.stationIdentifier))")
                .font(.caption)
            Text(observation.textDescription)
                .font(.title)
                .foregroundColor(.theme.green)
            if let temp = observation.temperature.value {
                HStack {
                    Image(systemName: "thermometer")
                        .foregroundColor(.theme.secondaryText)
                    Text(UnitsHelper.convertCtoF(temp).roundedString + "°")
                        .font(.largeTitle)
                }
            }
            if let wind = observation.windSpeed.value, let direction = observation.windDirection.value {
                HStack {
                    Image(systemName: "wind")
                        .foregroundColor(.theme.secondaryText)
                    Text(UnitsHelper.convertKilometersToMiles(wind).roundedString)
                    Image(systemName: "arrow.up")
                        .rotationEffect(Angle(degrees: direction + 180))
                        .animation(.easeInOut, value: direction)
                }
            }
            Text("Updated: " + observation.formattedTimestamp)
                .font(.caption2)
                .foregroundColor(.theme.secondaryText)
        }
    }
}

struct ObservationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ObservationView(observation: dev.observation, station: dev.station)
                .environmentObject(HomeViewModel())
            .previewLayout(.sizeThatFits)
            
            ObservationView(observation: dev.observation, station: dev.station)
                .environmentObject(HomeViewModel())
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
