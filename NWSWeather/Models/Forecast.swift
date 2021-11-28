//
//  Forecast.swift
//  NWSWeather
//
//  Created by Christopher Moore on 10/7/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct Forecast {
    var periods: [Period]
    
    enum CodingKeys: String, CodingKey {
        case properties
    }
    
    enum PropertiesKeys: String, CodingKey {
        case periods
    }
}

extension Forecast: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties = try container.nestedContainer(keyedBy: PropertiesKeys.self, forKey: .properties)
        periods = try properties.decode([Period].self, forKey: .periods)
    }
}


