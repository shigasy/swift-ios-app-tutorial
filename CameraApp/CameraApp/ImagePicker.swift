//
//  ImagePicker.swift
//  CameraApp
//
//  Created by Keita Shiga on 2020/08/27.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import SwiftUI

// UIKitフレームワークのclassだから、SwiftUIフレームワークで使えるUI部品にするための橋渡しするコード
// 最終的にはAPIリファレンスだが、
// Apple DeveloperとかApple Developer Forumsとかを見る
struct ImagePicker: UIViewControllerRepresentable {
    
    // UIViewControllerRepresentableプロトコルに宣言されているメソッド
    // UIKitフレームワークの中のUI部品（今回はUIImagePickerController）の調整役となるインスタンスを作るためのメソッド
    // その調整役がCoordinatorクラス
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        // UIImagePickerControllerというUIKitフレームワークのUI部品をインスタンス化
        let picker = UIImagePickerController()
        // 画像の取得方法をカメラ
        picker.sourceType = .camera
        // delegateとは直訳すると代理人という意味
        // あるクラスだけでは処理できない命令を、そのクラスの代わりに行うクラスのことをデリゲートと呼ぶ
        // 全てのクラスが別のクラスのデリゲートになれる
        picker.delegate = context.coordinator
        return picker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
    }
}

struct ImagePicker_Previews: PreviewProvider {
    static var previews: some View {
        ImagePicker()
    }
}
