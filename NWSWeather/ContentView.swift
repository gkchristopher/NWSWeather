//
//  ContentView.swift
//  NWSWeather
//
//  Created by Christopher Moore on 4/30/20.
//  Copyright © 2020 Roving Mobile, LLC. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = Model()
    
    var body: some View {
        NavigationView {
            List {
                Text("Office: \(model.point.office)")
                Text("GridX: \(model.point.gridX)")
                Text("GridY: \(model.point.gridY)")
                
                Spacer()
            }
            .navigationTitle("Point Metadata")
            .onAppear(perform: loadData)
        }
    }
    
    func loadData() {
        model.loadPointMetadata()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
