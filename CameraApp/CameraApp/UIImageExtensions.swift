//
//  UIImageExtensions.swift
//  CameraApp
//
//  Created by Keita Shiga on 2020/08/31.
//  Copyright © 2020 Keita Shiga. All rights reserved.
//

import UIKit
extension UIImage {
    func redraw() -> UIImage {
        let format = UIGraphicsImageRendererFormat()
        format.scale = 1
        return UIGraphicsImageRenderer(size: size, format: format)
            .image {
                context in draw(in: CGRect(origin: .zero, size: size))
            }
    }
}
