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
class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    var parent:ImagePicker
    
    init(_ parent:ImagePicker) {
        self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let uiImage = info[.originalImage] as! UIImage
        UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    }
}
