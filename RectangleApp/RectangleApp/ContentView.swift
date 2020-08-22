//
//  ContentView.swift
//  RectangleApp
//
//  Created by Keita Shiga on 2020/08/22.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Rectangleの構造体のインスタンスのpaddingメソッドを使用．
        // 変数に入れると，いつでもメソッド呼び出せるメリットがある
        // 変数に入れないと1行で済む
        // ビューライブラリに表示されているものは構造体
        // modifiersライブラリはメソッド
        Rectangle().padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
