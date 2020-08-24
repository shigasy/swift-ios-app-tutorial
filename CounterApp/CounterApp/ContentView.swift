//
//  ContentView.swift
//  CounterApp
//
//  Created by Keita Shiga on 2020/08/23.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var number = 0
    var body: some View {
        // VStackのあとに()を書かないのはトレイリングクロージャによって()を省略しているから
        VStack {
            Text("\(number)")
            
            // 短いクロージャの書き方
            Button(action: {self.number += 1}) {
                
            // 本来の無名関数（クロージャ）の書き方
//            Button(action: {() -> Void in self.number += 1}) {
                Text("カウント")
            }
            
            // 末尾がクロージャの場合、省略できる（トレイリングクロージャ）。しない場合は
            // ドキュメントを見ると init(action: () -> Void, label: () -> Label) と書いてある
            Button(action: {self.number += 1}, label: {Text("カウント")})
            
            
//            func count() {
//                self.number += 1
//            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
