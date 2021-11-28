//
//  Location.swift
//  NWSWeather
//
//  Created by Christopher Moore on 10/7/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import Foundation

//struct Location {
//    var city: String
//    var state: String
//    
//    enum CodingKeys: String, CodingKey {
//        case properties
//    }
//    
//    enum PropertiesKeys: String, CodingKey {
//        case city
//        case state
//    }
//}
//
//extension Location: Decodable {
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let properties = try container.nestedContainer(keyedBy: PropertiesKeys.self, forKey: .properties)
//        city = try properties.decode(String.self, forKey: .city)
//        state = try properties.decode(String.self, forKey: .state)
//    }
//}
