//
//  CommonExtensions.swift
//  customAnnotationMapkit
//
//  Created by Vineeth Vijayan on 12/06/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import UIKit
import Foundation

typealias ViewBlock = (view : UIView) -> Bool

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.nextResponder()
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    class func loadFromNibNamed(nibNamed: String, bundle: NSBundle? = nil) -> UIView? {
        return UINib(
            nibName: nibNamed,
            bundle: bundle
            ).instantiateWithOwner(nil, options: nil)[0] as? UIView
    }
    
    func loopViewHierarchy(block : ViewBlock?) {
        
        if block?(view: self) ?? true {
            for subview in subviews {
                subview.loopViewHierarchy(block)
            }
        }
    }
}