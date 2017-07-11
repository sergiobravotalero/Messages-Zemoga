//
//  UIColor.swift
//  Messages
//
//  Created by Sergio David Bravo Talero on 7/10/17.
//  Copyright © 2017 sergiobtalero. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
    
    // MARK: - App Colors
    open class var signatureBlack: UIColor {
        return UIColor(red: 16, green: 16, blue: 16)
    }
    
    open class var signatureSelectedBlack: UIColor {
        return UIColor(red: 39, green: 39, blue: 39)
    }
}
