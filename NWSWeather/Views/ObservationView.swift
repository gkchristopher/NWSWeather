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
            Text(observation.textDescription)
                .font(.headline)
                .foregroundColor(.theme.green)
            if let temp = observation.temperature.value {
                Text(UnitsHelper.convertCtoF(temp).roundedString + "°")
                    .font(.largeTitle)
            }
            if let wind = observation.windSpeed.value, let direction = observation.windDirection.value {
                Text("Wind: " + UnitsHelper.convertKilometersToMiles(wind).roundedString +
                     " " + DirectionsHelper.cardinalDirection(for: direction))
            }
            Text("Current conditions at " + station.name + " (\(station.stationIdentifier))")
                .font(.caption)
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
