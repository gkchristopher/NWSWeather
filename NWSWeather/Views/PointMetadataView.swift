//
//  PointMetadataView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct PointMetadataView: View {
    
    let point: Point
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("\(point.relativeLocation.properties.city), \(point.relativeLocation.properties.state)")
                .font(.headline)
                .foregroundColor(.theme.green)
            Text("Office: \(point.cwa)")
            HStack(spacing: 20) {
                Text("GridX: \(point.gridX)")
                Text("GridY: \(point.gridY)")
            }
        }
    }
}

struct PointMetadataView_Previews: PreviewProvider {
    static var previews: some View {
        PointMetadataView(point: dev.point)
            .previewLayout(.sizeThatFits)
    }
}
