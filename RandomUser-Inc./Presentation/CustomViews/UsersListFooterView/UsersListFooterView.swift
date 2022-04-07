//
//  UsersListFooterView.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 6/4/22.
//

import UIKit
import Lottie

class UsersListFooterView: UIView {

    // MARK: Outlets

    @IBOutlet weak var animationView: AnimationView!

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
        animationView.contentMode = .scaleAspectFit
        animationView.animation = Animation.named("loader_animation")
        animationView.loopMode = .loop
        animationView.play()
    }
}
