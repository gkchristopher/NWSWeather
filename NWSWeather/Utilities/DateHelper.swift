//
//  DateHelper.swift
//  NWSWeather
//
//  Created by Christopher Moore on 12/3/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct DateHelper {
    
    static let formatter = DateFormatter()
    
    static func formattedString(from date: Date) -> String {
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
}
