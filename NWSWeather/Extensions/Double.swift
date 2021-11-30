//
//  Double.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

extension Double {
    var numberString: String {
        String(format: "%.2f", self)
    }
    
    var roundedString: String {
        String(Int(self.rounded()))
    }
}
