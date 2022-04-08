//
//  BasePresenter.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 1/4/22.
//

import Foundation
import RxSwift

protocol BasePresenterProtocol {
    func viewDidLoad()
    func viewDidAppear(_ animated: Bool)
    func viewWillAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func attachView<T: BaseView>(view: T)
}

class BasePresenter: BasePresenterProtocol {

    internal var baseView: BaseView?
    internal let disposeBag: DisposeBag = DisposeBag()
    internal let router: Router

    init(router: Router) {
        self.router = router
    }

    func viewDidLoad() { }

    func viewDidAppear(_ animated: Bool) { }

    func viewWillAppear(_ animated: Bool) { }

    func viewWillDisappear(_ animated: Bool) { }

    func attachView<T>(view: T) where T : BaseView {
        self.baseView = view
    }

}
