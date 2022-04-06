//
//  UIImageView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

extension UIImageView {

    func rounded() {
        self.contentMode = .scaleAspectFit
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.layoutIfNeeded()
    }

}
