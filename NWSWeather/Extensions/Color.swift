//
//  Color.swift
//  NWSWeather
//
//  Created by Christopher Moore on 11/28/21.
//  Copyright © 2021 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

extension Color {
    static let theme = Theme()
}

struct Theme {
    let green = Color("Green")
    let blue = Color("Blue")
    let red = Color("Red")
    let orange = Color("Orange")
    let cyan = Color("Cyan")
    
    func color(for temperature: Int) -> Color {
        switch temperature {
        case 80...:
            return red
        case 65...:
            return orange
        case 50...:
            return Color.yellow
        case 40...:
            return blue
        default:
            return cyan
        }
    }
}
