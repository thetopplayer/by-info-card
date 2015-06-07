//
//  BYFont.swift
//  BryteYouthInfoCard
//
//  Created by Eddie Kaiger on 6/3/15.
//  Copyright (c) 2015 Eddie Kaiger. All rights reserved.
//

import Foundation
import UIKit

enum BYFontType {
    case UltraLight
    case UltraLightItalic
    case Light
    case LightItalic
    case Normal
    case NormalItalic
    case Bold
}

extension UIFont {
    
    class func font(type: BYFontType, fontSize size: CGFloat) -> UIFont! {
        
        var fontString = ""
        
        switch type {
        case .UltraLight:
            fontString = "UltraLight"
        case .UltraLightItalic:
            fontString = "UltraLightItalic"
        case .Light:
            fontString = "Regular"
        case .LightItalic:
            fontString = "Italic"
        case .Normal:
            fontString = "Medium"
        case .NormalItalic:
            fontString = "Medium-Italic"
        case .Bold:
            fontString = "DemiBold"
        default:
            fontString = "Regular"
        }
        
        return UIFont(name: String(format: "AvenirNext-%@", fontString), size: size)
    }
    
}