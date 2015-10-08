//
//  ImageUtils.swift
//  iOS Playground
//
//  Created by Giorgio Galante on 9/29/15.
//  Copyright © 2015 Galante Software. All rights reserved.
//

import Foundation
import UIKit

class ImageUtils {
    static func ResizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        if let image = image {
            let size = image.size
            let widthRatio  = targetSize.width  / image.size.width
            let heightRatio = targetSize.height / image.size.height

            var newSize: CGSize
            if widthRatio > heightRatio {
                newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
            } else {
                newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
            }

            UIGraphicsBeginImageContextWithOptions(newSize, false, UIScreen.mainScreen().scale)
            let rect = CGRectMake(0, 0, newSize.width, newSize.height)
            image.drawInRect(rect)
            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage
        } else {
            return nil
        }
    }
}
