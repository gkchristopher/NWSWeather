//
//  ForecastRowView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct ForecastRowView: View {
    
    let period: Period = Period(id: 1, name: "Test", temperature: 2, shortForecast: "None", detailedForecast: "long")
    
    var body: some View {
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

struct ForecastRowView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastRowView()
    }
}
