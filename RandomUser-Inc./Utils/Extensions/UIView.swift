//
//  UIView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

extension UIView {

    func loadNibFor<Subject>(_ subject: Subject) {
        loadNib(name: String(describing: subject))
    }

    func loadNib(name: String) {
        guard let view = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
}
