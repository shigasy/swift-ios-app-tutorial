//
//  ContentView.swift
//  LocalizationApp
//
//  Created by Keita Shiga on 2020/09/02.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().environment(\.locale, Locale(identifier: "en"))
            ContentView().environment(\.locale, Locale(identifier: "ja"))
        }
    }
}
