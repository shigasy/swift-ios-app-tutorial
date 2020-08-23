struct Square {
    // stored propaty
    // 値を保持するためのプロパティ
    var sideLength = 3
    
    // computed propatyは固定の値を保持しない
    // 呼び出されたタイミングで処理を行い，処理結果を返す
    // 定数（let）宣言はできない，値が変更されるから
    // 型名の省略はできない．初期値を代入しないから推論できない
    var area:Int {
        // {}の中に式が1つしかない場合はreturnを省略可能
        sideLength * sideLength
    }
    
    // method と computed propatyの大きな違いは
    // 引数を取ることが出来ない
    // 返り値がかならずあるかどうか
    // これらを考慮して使い分ける
    func areaMethod() -> Int {
        sideLength * sideLength
    }
}
let square = Square()
print(square.area)

// SwiftUIの初期に記載されているbodyプロパティはコンピューテッドプロパティ
// varで宣言され，末尾に{}があることからstoredではなくcomputed
//struct ContentView: View {
//    var body: some View {
//        Text("Hello, World!")
//    }
//}
