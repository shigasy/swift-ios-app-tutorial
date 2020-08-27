//
//  ContentView.swift
//  CameraApp
//
//  Created by Keita Shiga on 2020/08/27.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // オプショナル型で初期値を省略した場合、nilが入る
    // アプリ起動段階でなにもないため、オプショナル型に
    @State var image:Image?
    @State var isPicking = false
    var body: some View {
        ZStack {
            // Vertical
            VStack {
                VStack {
                    // UI部品とUI部品の間に空白を作るUI部品
                    // 伸び縮みする
                    Spacer()
                    // オプショナルチェーン
                    // nil以外の場合のみ、数珠つなぎになったメソッドやプロパティが順番に実行される
                    // nilの場合、ランタイムエラーになるから、それを防ぐ
                    image?.resizable().scaledToFit()
                    Spacer()
                }
                // Horizontal
                HStack {
                    Spacer()
                    // buttonにpaddingをつけることでボタンをタップしやすく
                    Button(action:{
                        self.isPicking = true
                    }) {
                        Image(systemName: "camera")
                        Text("カメラ")
                    }.padding()
                }
            }
            if isPicking {
                Rectangle().edgesIgnoringSafeArea(.all)
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
