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
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
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
