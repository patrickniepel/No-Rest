//
//  UIView.swift
//  PNCommons
//
//  Created by Patrick Niepel on 04.05.19.
//  Copyright © 2019 Patrick Niepel. All rights reserved.
//

import Foundation

public extension UIView {
    
    /** Returns the parent ViewController of this view instance */
    var presentingViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

/** Design */
public extension UIView {
    
    /**
     Applies rounded corners to this view instance
     - parameter cornerRadius: The desired cornerRadius value. The default value is '15'
     */
    func addRoundEdges(cornerRadius: CGFloat = 15) {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    /**
     Applies a border to this view instance
     - parameter width: The desired border width. The default value is '1'
     - parameter color: The desired border color. The default value is 'black'
     */
    func addBorder(width: CGFloat = 1, color: UIColor = .black) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    /**
     Applies a default shadow to this view instance
     - parameter color: The desired shadow color. The default value is 'black'
     */
    func addDefaultShadow(color: UIColor = .black) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 10)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10
        layer.masksToBounds = false
    }
}

/** Layout */
public extension UIView {
    
    /**
     Adds one or more views as subviews to this instance
     - parameter views: The views to add
     */
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

/** Constraints */
public extension UIView {
    
    /** Programmatic constraints */
    struct AnchoredConstraints {
        var top, leading, bottom, trailing, centerX, centerY, width, height: NSLayoutConstraint?
    }
    
    /**
     Anchors this view instance with the specified constraints
     - parameter top: The top anchor of the view to align this view's top anchor to; not active if nil
     - parameter leading: The leading anchor of the view to align this view's leading anchor to; not active if nil
     - parameter bottom: The bottom anchor of the view to align this view's bottom anchor to; not active if nil
     - parameter trailing: The trailing anchor of the view to align this view's trailing anchor to; not active if nil
     - parameter centerX: The centerX anchor of the view to align this view's centerX anchor to; not active if nil
     - parameter centerY: The centerY anchor of the view to align this view's centerY anchor to; not active if nil
     - parameter padding: The desired edge insets. Zero by default
     - parameter size: The desired size for this view instance. Zero by default
     - returns: The anchored constraints (top, leading, bottom, trailing, centerX, centerY, width, height)
    */
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, centerX: NSLayoutXAxisAnchor? = nil, centerY: NSLayoutYAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchoredConstraints = AnchoredConstraints()
        
        if let top = top {
            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if let centerX = centerX {
            anchoredConstraints.centerX = centerXAnchor.constraint(equalTo: centerX)
        }
        
        if let centerY = centerY {
           anchoredConstraints.centerY = centerYAnchor.constraint(equalTo: centerY)
        }
        
        if size.width != 0 {
            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing,  anchoredConstraints.centerX, anchoredConstraints.centerY, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
        
        return anchoredConstraints
    }
    
    /**
     Aligns this view instance to all four edges of its superview
     - parameter padding: The desired edge insets. Zero by default
    */
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    /**
     Centers this view instance within its superview
     - parameter size: The desired size for this view instance. Zero by default
    */
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    /** Returns the UILayoutGuide for this view instance */
    func layoutGuide() -> UILayoutGuide {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        }
        return layoutMarginsGuide
    }
}
