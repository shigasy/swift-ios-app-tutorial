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

class TaiyakiClass {
    var nakami = "あんこ"
    func sayNakami() {
        print(nakami)
    }
}

// structは値型
// classは参照型であり、アドレスがコピーされる
let taiyakiClass = TaiyakiClass()
let taiyakiClass2 = taiyakiClass
taiyakiClass.nakami = "クリーム"
taiyakiClass.sayNakami() // => クリーム
taiyakiClass2.sayNakami() // => クリーム

// プロトコル
// 他言語でいうインターフェイスの役割
// プロトコルを型として使う
// 構造体・列挙体・クラスの3つで使うことがあるが、構造体の使用頻度が圧倒的に多い
// ドキュメントを読んで、get set と出たら、恐らくプロトコルの宣言がそうなっている

protocol KyotoProtocol {
    // ストアドプロパティ getのみの読み取り専用も可能
    var co2: Double { get set }
    // コンピューテッドプロパティ 計算して返すプロパティなため、getのみ（あとコンピューテッドプロパティはvar）
    var carbonTax: Double { get }
    func stopGlobalWarming()
}

struct Japan: KyotoProtocol {
    var co2: Double = 42
    var carbonTax: Double {
        co2 * 0.1
    }
    func stopGlobalWarming() {
        print("森林増やすよ")
    }
}
var japan = Japan()
print(japan.co2)
print(japan.carbonTax)

// --------------
// delegate

// デリゲートは必ずプロトコルを批准する
protocol LayerLicense {
    func defend()
}

// 弁護士クラス
// delegateのプロパティがLayerLicenseに批准したインスタンスしか受け付けないため、Lawyerクラスをプロトコルに批准させる
class Lawyer: LayerLicense {
    func defend() {
        print("異議あり！")
    }
}

// 被告人クラス
class Defender {
    var delegate:LayerLicense?
}


let taro = Defender()
taro.delegate = Lawyer()
// taroに弁護能力がなくても、代理人を通して弁護することが出来る
// このdelegateプロパティのことをデリゲートと呼ぶ
taro.delegate!.defend()
