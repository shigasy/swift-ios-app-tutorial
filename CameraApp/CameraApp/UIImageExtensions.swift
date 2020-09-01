//
//  UIImageExtensions.swift
//  CameraApp
//
//  Created by Keita Shiga on 2020/08/31.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import UIKit

// この方法で画像を取得・表示をすると画像の縦横比が変化して、画像が潰れることがあるため、画像の向きを修正する
// Apple社から提供されているような、私達が編集できないクラスについてextensionキーワードを使うことで、新たに機能を追加できる
extension UIImage {
    func redraw() -> UIImage {
        // 描画設定をするクラス
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        // sizeはCGSizeの構造体の型であり、画像の論理サイズ（Retinaなどは@2xなどされるが、その前のサイズ）を反映し、画像の現在の向きを考慮する
        return UIGraphicsImageRenderer(size: size, format: format)
            .image {
                context in draw(in: CGRect(origin: .zero, size: size))
            }
    }
}
