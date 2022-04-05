//
//  UIViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

extension UIViewController {

    func loadNibFor<Subject>(viewControllerClass: Subject) {
        loadNib(name: String(describing: viewControllerClass))
    }

    func loadNib(name: String) {
        let viewNib = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView
        viewNib?.frame = self.view.bounds
        viewNib?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(viewNib!)
    }

}
