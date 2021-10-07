//
//  Place.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import Foundation

struct Coordinate: Decodable {
    var latitude: Double
    var longitude: Double
}

struct Point {
//    var coordinates: Coordinate
    var office: String
    var gridX: Int
    var gridY: Int
    
    enum CodingKeys: String, CodingKey {
        case properties
//        case geometry
    }
    
    enum PropertiesKeys: String, CodingKey {
        case office = "cwa"
        case gridX
        case gridY
    }
    
//    enum GeometryKeys: String, CodingKey {
//        case coordinates
//    }
}

extension Point: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let properties = try container.nestedContainer(keyedBy: PropertiesKeys.self, forKey: .properties)
        office = try properties.decode(String.self, forKey: .office)
        gridX = try properties.decode(Int.self, forKey: .gridX)
        gridY = try properties.decode(Int.self, forKey: .gridY)
    }
}
