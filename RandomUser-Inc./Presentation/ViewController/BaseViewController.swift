//
//  BaseViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import UIKit

protocol Loading {
    func showLoader(model: Loader?)
    func hideLoader()
}

protocol BaseView: Loading {
    func showError<E>(error: E) where E: Swift.Error
    func showNativeAlert(title: String, message: String?)
    func setupStyles()
}

class BaseViewController<P: BasePresenter>: UIViewController, BaseView {
    
    // MARK: Variables
    
    typealias Presenter = P
    var presenter: Presenter!
    private var loader: LoaderViewController?
    
    // MARK: UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStyles()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear(animated)
    }
    
    // MARK: BaseView
    
    func showNativeAlert(title: String, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func setupStyles() {
        self.view.backgroundColor = .black
    }
    
    func showLoader(model: Loader?) {
        loader = LoaderViewController()
        loader?.modalPresentationStyle = .overFullScreen
        loader?.setModel(model: model)
        
        guard let loader = loader
        else { return }
        self.present(loader, animated: true)

    }
    
    func hideLoader() {
        loader?.dismiss(animated: true)
    }
    
    func showError<E>(error: E) where E: Swift.Error {
        showNativeAlert(title: "Error", message: error.localizedDescription)
    }
}
