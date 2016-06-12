//
//  CustomAnnotationView.swift
//  customAnnotationMapkit
//
//  Created by Vineeth Vijayan on 12/06/16.
//  Copyright © 2016 creativelogics. All rights reserved.
//

import Foundation
import MapKit

class CustomAnnotationView: MKAnnotationView {
    // Required for MKAnnotationView
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func didAddSubview(subview: UIView) {
        if selected {
            setNeedsLayout()
        }
    }
    
    override func layoutSubviews() {
        if !selected {
            return
        }
 
        loopViewHierarchy({ (view: UIView) -> Bool in
            print(view.className)
            if view.className == "_MKSmallCalloutPassthroughButton"{
                view.backgroundColor = UIColor.blueColor()
            }
            if let label = view as? UILabel {
                if label.text == "Title" {
                    let tempView = UIView.loadFromNibNamed("PopupLabelView") as! PopupLabelView
                    let frame = label.frame
                    tempView.frame = frame
                    tempView.frame.size = CGSize(width: (label.superview?.frame.size.width)! - 24, height: label.frame.size.height + 8)
                    
                    view.superview?.addSubview(tempView)
//                    view.superview?.backgroundColor = UIColor.greenColor()
                    return false
                }
            }
            return true
        })
    }
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        image = UIImage(named: "flag")
    }
}


extension NSObject {
    
    public var className: String {
        return self.dynamicType.className
    }
    
    public static var className: String {
        return stringFromClass(self)
    }
    
}

public func stringFromClass(aClass: AnyClass) -> String {
    return NSStringFromClass(aClass).componentsSeparatedByString(".").last!
}
