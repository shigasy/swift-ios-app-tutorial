//
//  ContentView.swift
//  MapAPp
//
//  Created by Keita Shiga on 2020/08/24.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import MapKit
import SwiftUI

// UIViewRepresentableはプロトコルであり、makeUIViewとupdateUIViewの関数を必要とする型
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView()
    }
    func updateUIView(_ uiView: MKMapView, context: Context) {
    }
}

// Viewプロトコルに批准
struct ContentView: View {
    // some => bodyの戻り値の方もViewプロトコルに批准していなければならない
    var body: some View {
        MapView().edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    // Viewプロトコルに批准
    static var previews: some View {
        ContentView()
    }
}
