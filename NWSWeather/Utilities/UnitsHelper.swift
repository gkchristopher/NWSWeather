//
//  UnitHelper.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct UnitsHelper {
    static func convertCtoF(_ value: Double) -> Double {
        value * 9 / 5 + 32
    }
    
    static func convertKilometersToMiles(_ value: Double) -> Double {
        value * 0.6214
    }
}
