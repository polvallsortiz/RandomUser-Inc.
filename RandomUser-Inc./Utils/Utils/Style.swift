//
//  Style.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 7/4/22.
//

import Foundation
import UIKit

class Style {
    enum TextStyle {
        case title
        case subtitle
        case body
        case button
    }

    struct TextAttributes {
        let font: UIFont
        let color: UIColor
        let backgroundColor: UIColor?

        init(font: UIFont, color: UIColor, backgroundColor: UIColor? = nil) {
            self.font = font
            self.color = color
            self.backgroundColor = backgroundColor
        }
    }

    // MARK: General properties

    let backgroundColor: UIColor
    let preferredStatusBarStyle: UIStatusBarStyle

    let attributesForStyle: (_ style: TextStyle) -> TextAttributes

    init(backgroundColor: UIColor,
         preferredStatusBarStyle: UIStatusBarStyle = .default,
         attributesForStyle: @escaping (_ style: TextStyle) -> TextAttributes) {
        self.backgroundColor = backgroundColor
        self.preferredStatusBarStyle = preferredStatusBarStyle
        self.attributesForStyle = attributesForStyle
    }

    // MARK: Convenience getters

    func font(for style: TextStyle) -> UIFont {
        return attributesForStyle(style).font
    }

    func color(for style: TextStyle) -> UIColor {
        return attributesForStyle(style).color
    }

    func backgroundColor(for style: TextStyle) -> UIColor? {
        return attributesForStyle(style).backgroundColor
    }

}

extension Style {
    static var app: Style {
        return Style(
            backgroundColor: .lightGray,
            preferredStatusBarStyle: .lightContent,
            attributesForStyle: { $0.appAttributes }
            )
    }

    func apply(textStyle: TextStyle, to label: UILabel) {
        let attributes = attributesForStyle(textStyle)
        label.font = attributes.font
        label.textColor = attributes.color
        label.backgroundColor = attributes.backgroundColor
    }

    func apply(textStyle: TextStyle = .button, to button: UIButton) {
        let attributes = attributesForStyle(textStyle)
        button.setTitleColor(attributes.color, for: .normal)
        button.titleLabel?.font = attributes.font
        button.backgroundColor = attributes.backgroundColor
    }

}

private extension Style.TextStyle {
    var appAttributes: Style.TextAttributes {
        switch self {
        case .title:
            return Style.TextAttributes(font: .appTitle, color: .black)
        case .subtitle:
            return Style.TextAttributes(font: .appSubtitle, color: .darkGreen)
        case .body:
            return Style.TextAttributes(font: .appBody, color: .darkBlue)
        case .button:
            return Style.TextAttributes(font: .appButton, color: .lightBlue, backgroundColor: .mediumGreen)
        }
    }
}
