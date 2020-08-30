//
//  Coordinator.swift
//  CameraApp
//
//  Created by Keita Shiga on 2020/08/27.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

// NSObjectクラスを継承
// UINavigationConrtollerDelegateとUIImagePickerCOntrollerDelegateはプロトコル
// UINavigationConrtollerDelegateとUIImagePickerCOntrollerDelegateはNSObjectProtocolプロトコルを継承している。
//  UINavigationConrtollerDelegateとUIImagePickerCOntrollerDelegateを批准するために必要となるプロパティやメソッドに加えて、NSObjectProtocolプロトコルを批准するために必要となるプロパティやメソッドも定義しなければならない。
//  NSObjectProtocolプロトコルに批准するために必要なプロパティやメソッドを書くと複雑になるため、NSObjectクラスを継承することで、それらのプロパティやメソッドを継承する。
// クラスを継承することで多くの機能を利用できるようになる。
// クラスには1つの親しか指定でいないが、プロトコルは複数指定して、批准できる
//
// 2つのプロトコルはoptionalが付いていて、プロパティやメソッドの実装は任意
// 任意にも関わらず、プロトコルを指定する理由はプロトコルを批准させると、引数を使って値を取得できるようになっているから。
// 例えば、imagePickerControllerメソッドの実装はオプションで、ユーザーが写真を撮り終えたタイミングでiOSが自動的に呼び出すメソッド
// 引数にはユーザーが撮影した画像が含まれる
// なくても、最低限アプリが動くため、オプションになっている（カメラアプリとして画像を保存したり編集したりできないのはカメラアプリとして失格だが。）
// そのメソッドを実装しないとアプリが動作しない場合は、必須のメソッドとなっている

// プロトコルはUIKitフレームワークを使ってカメラ機能を実装する場合はほぼ強制的にこの2つのプロトコルを批准させることになる。Apple社が定めたルール
// 末尾にdelegateという名称がついていて、これらのプロトコルが「デリゲートになるための約束事が書かれたプロトコル」
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    // ImagePicker構造体
    var parent:ImagePicker
    
    // 初期値を代入していないため、イニシャライザを定義
    init(_ parent:ImagePicker) {
        self.parent = parent
    }
    
    // 撮影した画像を写真ライブラリに保存
    // このメソッドはiOSが自動的に呼び出すメソッド
    // 写真撮影後、Use Photoボタンをタップしたタイミングで呼び出される
    // このメソッドは、UIImagePickerControllerDelegateプロトコル内で宣言されている
    // 内部引数のinfoには[UIImagePickerController.InfoKey:Any]型の辞書が渡される
    // Any型の理由は、画像（UIImageクラス）以外にも撮影時刻や場所などの文字列型も含まれている。それぞれに適した型で引数を受け入れようとすると、対応するデータの種類分だけ引数を用意しなければならなくなる。種類が増えた分だけコードが冗長的になる（Anyにしておいて色々情報渡すけど、アプリ開発者側で好きなようにしてくれって感じかな）
    // しかし、プログラムの正当性を型を使ってチェックしたいため、タイプキャスティング（適した型に変換する）ことが大切。
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // オリジナルの画像を取得
        // Any型だと、正当性をチェックできないため、UIImage型にタイプキャスティング
        // タイプキャスティングは継承関係内でしか実行できない
        // アップキャスティングは基本的に成功するため、特別な書式は用意されておらず、継承海藻の上にある型に入れるだけで完了（let hoge:Any = uiImage）
        // ダウンキャスティングによる失敗を未然に防ぐための文法が用意されており、それが as! である
        // 必ずas!キーワードを指定することで、そのタイプキャスティングがダウンキャスティングであることを明示する必要がある
        let uiImage = info[.originalImage] as! UIImage
        
        // UIImageWriteToSavedPhotosAlbumの第一引数はImage型の引数にしていすることになるため、UIImageにダウンキャストしないとエラーが出る
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    }
}
