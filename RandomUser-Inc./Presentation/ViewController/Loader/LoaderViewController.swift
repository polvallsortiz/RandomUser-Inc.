//
//  LoaderViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import UIKit

struct Loader {
    var title: String?

    init(title: String?) {
        self.title = title
    }
}

class LoaderViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: Private variables

    private var model: Loader?

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = model?.title
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        activityIndicator.stopAnimating()
    }

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: LoaderViewController.self)
    }

    // MARK: Public methods

    func setModel(model: Loader?) {
        self.model = model
    }

}
