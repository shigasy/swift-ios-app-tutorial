import UIKit

struct Taiyaki {
    var nakami = "あんこ"
    func sayNakami() {
        print("中身は\(nakami)です")
    }
}
//class Bar {
//    var a: UInt8
//    var b: UInt8
//    init(a: UInt8, b: UInt8) { self.a = a; self.b = b }
//}
//let bar = Bar(a: 3, b: 127)
//bar.a = 5 // OK

// 構造体だから，値型であり，ERRORになる．
// classだったら，参照型だから，letでも書き換えられる．？
// structの目的は比較的単純なデータ値をカプセル化すること
// メモリ云々はSwiftにCopy on Writeという「値型のオブジェクトは、代入先で書き込まれた時に初めてコピーされる」機能があるらしく，そこまで気にしなくて良いらしい．
// https://qiita.com/narukun/items/24d9e68ff965f8da09ad
// classだと以下のvarがletにできる
var taiyaki = Taiyaki()
taiyaki.nakami = "クリーム"
// 値がコピーされて，コピーされたインスタンスのプロパティを変更されて，コピーされたインスタンスのメソッドを使っているから変更される．
taiyaki.sayNakami()

// class使って，参照型でもlet使って instance.propaty = 'a'と出来るだろうけど，どこで変更したか分からなくなりそうなので，セッターか何か使ったほうが良さそうだな〜，わからん．正直初期化以外で上書きしたくない．


// enumの入れ子
// enumから始めても良い。何重になってもドットでアクセスできる
struct TaiyakiWithEnum {
    enum nakami {
        case anko
        case cream
        case chocolate
    }
}
print(TaiyakiWithEnum.nakami.anko)
