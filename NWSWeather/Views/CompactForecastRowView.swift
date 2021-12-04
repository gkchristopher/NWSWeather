//
//  CompactForecastRowView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 12/3/21.
//

import SwiftUI

struct CompactForecastRowView: View {
    
    let period: Period
    let width: Double
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(period.name)
                .font(.headline)
                .foregroundColor(.theme.green)
            ZStack(alignment: .topTrailing) {
                IconImageView(urlString: period.icon, iconName: period.iconImageName)
                    .frame(width: width, height: width)
                Text("\(period.temperature)°")
                    .font(.title)
                    .foregroundColor(.primary)
                    .bold()
                    .shadow(color: .black, radius: 4, x: 3, y: 3)
            }
            Text("\(period.windSpeed) \(period.windDirection)")
                .font(.caption)
        }
        .frame(minHeight: 180, alignment: .top)
        //        .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray))
    }
}

struct CompactForecastRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CompactForecastRowView(period: dev.period2, width: 150)
                .previewLayout(.sizeThatFits)
            
            CompactForecastRowView(period: dev.period1, width: 150)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
