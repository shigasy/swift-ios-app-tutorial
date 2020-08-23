//
//  ContentView.swift
//  SmileApp
//
//  Created by Keita Shiga on 2020/08/23.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // resizable()などのメソッドはImage構造体のインスタンスなため，メソッドチェーンができる
        // ラベル名: systemName
        Image(systemName: "smiley")
            // 画面サイズを変更するmodifier
            .resizable()
            // 縦横比を適正に設定
            .foregroundColor(.green)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .scaledToFit()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
