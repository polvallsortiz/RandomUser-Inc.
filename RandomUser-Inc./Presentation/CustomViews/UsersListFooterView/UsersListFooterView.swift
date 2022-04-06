//
//  UsersListFooterView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 6/4/22.
//

import UIKit

class UsersListFooterView: UIView {

    // MARK: Outlets
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    // MARK: UIView

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadNibFor(UsersListFooterView.self)
        setup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadNibFor(UsersListFooterView.self)
        setup()
    }

    // MARK: Private methods

    private func setup() {
        activityIndicatorView.startAnimating()
    }
}
