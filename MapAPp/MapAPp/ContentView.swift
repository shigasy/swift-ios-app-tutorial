//
//  ContentView.swift
//  MapAPp
//
//  Created by Keita Shiga on 2020/08/24.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

struct ContentView: View {
    var body: some View {
        MapView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
