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
            // モーダルビュー
            // ユーザーに対して何らかの注意を促したい場合や、特定のコンテンツに集中してもらいたい場合に使用する
            if isPicking {
                Rectangle()
                    // セーフエリア外に表示できるやつ
                    // 時計やバッテリー残量の表示などに鑑賞するため、限られた用途に使われる
                    // カメラの表示など、統一感のある背景をデザインするため
                    .edgesIgnoringSafeArea(.all)
                    // UI部品がbodyプロパティに追加されたとき、または削除されたときのアニメーション
                    .transition(.move(edge: .bottom))
                    // トランジションのみではアニメーションは起こらない
                    // アニメーションが起きる時に、どのようなアニメーションか指定
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
