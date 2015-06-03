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
        case .Light:
            fontString = "Light"
        case .LightItalic:
            fontString = "LightOblique"
        case .Normal:
            fontString = "Book"
        case .NormalItalic:
            fontString = "BookOblique"
        case .Bold:
            fontString = "Heavy"
        default:
            fontString = "Book"
        }
        
        return UIFont(name: String(format: "Avenir-%@", fontString), size: size)
    }
    
}