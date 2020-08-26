//
//  ContentView.swift
//  CardApp
//
//  Created by Keita Shiga on 2020/08/26.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var cards = ["かばん": "bag",
                 "自動車": "car",
                 "誕生日": "birthday"]
    @State var japanese = "かばん"
    @State var isJapanese = true
    var body: some View {
        ZStack {
            Color(red: 0.97, green: 0.96, blue: 0.56).edgesIgnoringSafeArea(.all)
            VStack {
                ZStack {
                    Image("card").resizable().frame(width: 300.0, height: 133.0)
                        .shadow(radius: 3).rotation3DEffect(.degrees(isJapanese ? 0 : 180), axis: (x: 0, y: 1, z: 0))
                        .animation(.spring())
                        .onTapGesture {
                            self.isJapanese.toggle()
                    }
                    
                    // nilでないことを保証する !キーワード
                    // コンパイラに伝える
                    Text(isJapanese ? japanese : cards[japanese]!).font(.largeTitle)
                }.padding()
                HStack {
                    Group {
                        // bool型は構造体であり、そのメソッドとしてtoggleがある
                        // その他の文字列型や数値型も同様。
                        // 文字列型はcountというプロパティがある String.count
                        // 構造体、class、enumで作られている場合もあり、3つまとめて型と呼ぶ
                        Button(action: {self.isJapanese.toggle()}) {
                            Image(systemName: "arrow.2.circlepath")
                            Text(/*@START_MENU_TOKEN@*/"裏返す"/*@END_MENU_TOKEN@*/)
                        }
                        Button(action:
                            {
                                self.isJapanese = true
                                // randomElementの返り値は(key: String, value: String)?
                                // タプルは複数の型を扱える -> 配列や辞書とは大きく異なる
                                // しかし、要素の追加や削除が行えない
                                self.japanese = self.cards.randomElement()!.key
                        }) {
                            Image(systemName: "forward.fill")
                            Text(/*@START_MENU_TOKEN@*/"次へ"/*@END_MENU_TOKEN@*/)
                        }}.padding().foregroundColor(.white).background(Color(red: 0.86, green: 0.45, blue: 0.03)).cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
