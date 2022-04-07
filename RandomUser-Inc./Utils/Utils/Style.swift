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
            attributesForStyle: { $0.appAttributes })
    }

    static var cells: Style {
        return Style(backgroundColor: .lightGray,
                     preferredStatusBarStyle: .default,
                     attributesForStyle: { $0.cellsAttributes })
    }

    static var detail: Style {
        return Style(backgroundColor: .superLightBrown,
                     preferredStatusBarStyle: .default,
                     attributesForStyle: { $0.detailAttributes })
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
            return Style.TextAttributes(font: .appSubtitle, color: .darkGray)
        case .body:
            return Style.TextAttributes(font: .appBody, color: .black)
        case .button:
            return Style.TextAttributes(font: .appButton, color: .black, backgroundColor: .darkBrown)
        }
    }

    var cellsAttributes: Style.TextAttributes {
        switch self {
        case .title:
            return Style.TextAttributes(font: .cellTitle, color: .black)
        case .subtitle:
            return Style.TextAttributes(font: .cellSubtitle, color: .black)
        case .body:
            return Style.TextAttributes(font: .cellInfo, color: .black)
        case .button:
            return Style.TextAttributes(font: .cellSubtitle, color: .white, backgroundColor: .darkBrown)
        }
    }

    var detailAttributes: Style.TextAttributes {
        switch self {
        case .title:
            return Style.TextAttributes(font: .detailTitle, color: .black)
        case .subtitle:
            return Style.TextAttributes(font: .detailSubtitle, color: .black)
        case .body, .button:
            return Style.TextAttributes(font: .detailBody, color: .black)
        }
    }
}
