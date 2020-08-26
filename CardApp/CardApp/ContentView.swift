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
        VStack {
            Text(isJapanese ? japanese : cards[japanese]!)
            HStack {
                Button(action: {self.isJapanese.toggle()}) {
                    Text(/*@START_MENU_TOKEN@*/"裏返す"/*@END_MENU_TOKEN@*/)
                }
                Button(action:
                    {
                        self.isJapanese = true
                        self.japanese = self.cards.randomElement()!.key
                }) {
                    Text(/*@START_MENU_TOKEN@*/"次へ"/*@END_MENU_TOKEN@*/)
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
