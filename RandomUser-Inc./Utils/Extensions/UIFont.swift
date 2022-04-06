//
//  UIFont.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit

extension UIFont {

    static var appTitle: UIFont {
        return UIFont.systemFont(ofSize: 18)
    }

    static var appSubtitle: UIFont {
        return UIFont.systemFont(ofSize: 14, weight: .light)
    }

    static var appBody: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }

    static var appButton: UIFont {
        return UIFont.systemFont(ofSize: 12, weight: .semibold)
    }

}
