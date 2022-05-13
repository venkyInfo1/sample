//
//  UIView+Extension.swift
//  MV
//
//  Created by Apple on 12/05/22.
//

import Foundation
import UIKit
extension UIView {
    func setShadow(_ radius:CGFloat = 2, andOpacity opacity:Float = 0.16) {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset =  CGSize(width: 0.25, height: 0.5)
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = false
    }
}
