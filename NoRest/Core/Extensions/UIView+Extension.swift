//
//  UIView+Extension.swift
//
//  Created by Patrick Niepel on 1/13/19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import UIKit

extension UIView {
    
    func applyShadow() {
        self.layer.shadowColor = UIColor.shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 10)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 10
        self.layer.masksToBounds = false
    }
}

extension UIImage {
    
    func dye(with color: UIColor) -> UIImage {
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
