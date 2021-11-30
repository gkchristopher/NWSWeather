//
//  ForecastRowView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct ForecastRowView: View {
    
    let period: Period
    
    var body: some View {
        HStack(spacing: 6) {
            VStack(alignment: .leading, spacing: 4) {
                Text(period.name)
                    .font(.headline)
                    .foregroundColor(.theme.green)
                Text(period.detailedForecast)
            }
            Spacer()
            Text("\(period.temperature)°")
                .font(.title)
                .bold()
        }
    }
}

struct ForecastRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForecastRowView(period: dev.period2)
                .previewLayout(.sizeThatFits)
            
            ForecastRowView(period: dev.period1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
