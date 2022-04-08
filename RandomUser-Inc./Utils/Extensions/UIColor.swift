//
//  UIColor.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit

extension UIColor {

    convenience init?(hex: String) {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            self.init(red: CGFloat((0xFFFFFF & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((0xFFFFFF & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(0xFFFFFF & 0x0000FF) / 255.0,
                      alpha: CGFloat(1.0))
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: CGFloat(1.0))
    }

    static var appBlack: UIColor {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor.white
            } else {
                return UIColor.black
            }
        }
    }

    static var darkBrown: UIColor {
        return UIColor(hex: "#C6A785")!
    }

    static var lightBrown: UIColor {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor.lightGray
            } else {
                return UIColor(hex: "#EFE6DC")!
            }
        }
    }

    static var superLightBrown: UIColor {
        return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
            if UITraitCollection.userInterfaceStyle == .dark {
                return UIColor.black
            } else {
                return UIColor(hex: "#F7F2EE")!
            }
        }
    }

}
