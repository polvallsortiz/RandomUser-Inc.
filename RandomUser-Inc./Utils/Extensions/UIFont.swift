//
//  UIFont.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit

extension UIFont {
    enum PlayfairDisplayWeight: String {
        case italic = "PlayfairDisplay-Italic"
        case regular = "PlayfairDisplay-Regular"
        case medium = "PlayfairDisplay-Medium"
        case bold = "PlayfairDisplay-Bold"
    }

    // MARK: Convnience init
    convenience init(weight: PlayfairDisplayWeight, size: CGFloat) {
        self.init(name: weight.rawValue, size: size)!
    }

    // MARK: App global fonts

    static var navBarLargeTitle: UIFont {
        return UIFont.init(weight: .bold, size: 48)
    }

    static var navBarTitle: UIFont {
        return UIFont.init(weight: .bold, size: 32)
    }

    static var appTitle: UIFont {
        return UIFont.init(weight: .bold, size: 18)
    }

    static var appSubtitle: UIFont {
        return UIFont.init(weight: .medium, size: 14)
    }

    static var appBody: UIFont {
        return UIFont.init(weight: .regular, size: 12)
    }

    static var appItalicBody: UIFont {
        return UIFont.init(weight: .italic, size: 12)
    }

    static var appButton: UIFont {
        return UIFont.init(weight: .regular, size: 12)
    }

    // MARK: Cells fonts

    static var cellTitle: UIFont {
        return UIFont.init(weight: .bold, size: 20)
    }

    static var cellSubtitle: UIFont {
        return UIFont.init(weight: .regular, size: 14)
    }

    static var cellInfo: UIFont {
        return UIFont.init(weight: .italic, size: 12)
    }

    // MARK: Detail fonts

    static var detailTitle: UIFont {
        return UIFont.init(weight: .bold, size: 40)
    }

    static var detailSubtitle: UIFont {
        return UIFont.init(weight: .bold, size: 24)
    }

    static var detailBody: UIFont {
        return UIFont.init(weight: .medium, size: 12)
    }
}
