//
//  UIImage.swift
//  PNCommons
//
//  Created by Patrick Niepel on 25.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UIImage {
    
    /**
     Uses the specified color to dye an image
     - parameter color: The color to dye the image
     - returns: The dyed image
     */
    func dye(_ color: UIColor) -> UIImage {
        defer {
            UIGraphicsEndImageContext()
        }
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        
        guard let cgImage = self.cgImage else {
            return self
        }
        context?.clip(to: rect, mask: cgImage)
        context?.fill(rect)
        
        guard let newImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return self
        }
        
        return newImage
    }
}
