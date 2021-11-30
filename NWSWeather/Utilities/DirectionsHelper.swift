//
//  DirectionsHelper.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/29/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct DirectionsHelper {
    
//    Cardinal Direction    Degree Direction
        
//    N                     348.75 - 11.25
//    NNE                    11.25 - 33.75
//    NE                     33.75 - 56.25
//    ENE                    56.25 - 78.75
//    E                      78.75 - 101.25
//    ESE                   101.25 - 123.75
//    SE                    123.75 - 146.25
//    SSE                   146.25 - 168.75
//    S                     168.75 - 191.25
//    SSW                   191.25 - 213.75
//    SW                    213.75 - 236.25
//    WSW                   236.25 - 258.75
//    W                     258.75 - 281.25
//    WNW                   281.25 - 303.75
//    NW                    303.75 - 326.25
//    NNW                   326.25 - 348.75
    
    static func cardinalDirection(for degrees: Double) -> String {
        let normalizedDegrees = degrees.truncatingRemainder(dividingBy: 360.0)
        
        switch normalizedDegrees {
        case 0..<11.25, 348.75...:
            return "N"
        case 11.25..<33.75:
            return "NNE"
        case 33.75..<56.25:
            return "NE"
        case 56.25..<78.75:
            return "ENE"
        case 78.75..<101.25:
            return "E"
        case 101.25..<123.75:
            return "ESE"
        case 123.75..<146.25:
            return "SE"
        case 146.25..<168.75:
            return "SSE"
        case 168.75..<191.25:
            return "S"
        case 191.25..<213.75:
            return "SSW"
        case 213.75..<236.25:
            return "SW"
        case 236.25..<258.75:
            return "WSW"
        case 258.75..<281.25:
            return "W"
        case 281.25..<303.75:
            return "WNW"
        case 303.75..<326.25:
            return "NW"
        case 326.25..<348.75:
            return "NNW"
        default:
            return "N"
        }
    }
}
