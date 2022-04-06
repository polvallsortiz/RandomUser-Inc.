//
//  UsersListViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

protocol UsersListView: BaseView {
    func refreshUsers()
}

class UsersListViewController: BaseViewController<UsersListPresenter> {

    // MARK: Outlets
    @IBOutlet weak var usersTableView: UITableView!

    // MARK: UIViewController

    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: UsersListViewController.self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: Private methods

    private func setupView() {
        usersTableView.register(UINib(nibName: String(describing: UsersListTableViewCell.self), bundle: nil),
                                forCellReuseIdentifier: String(describing: UsersListTableViewCell.self))
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.showsVerticalScrollIndicator = false
    }

    private func addFooterView() {
        if usersTableView.tableFooterView == nil {
            let footer = UsersListFooterView(frame: CGRect(x: 0, y: 0, width: usersTableView.bounds.size.width, height: 100))
            usersTableView.tableFooterView = footer
        }
    }

}

extension UsersListViewController: UsersListView, UITableViewDelegate, UITableViewDataSource {

    func refreshUsers() {
        usersTableView.tableFooterView = nil
        usersTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.totalCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UsersListTableViewCell.self), for: indexPath) as? UsersListTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(model: UsersListTableViewCellViewModel(user: presenter.user(at: indexPath.row)))

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()

        visibleRect.origin = usersTableView.contentOffset
        visibleRect.size = usersTableView.bounds.size

        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)

        guard let indexPath = usersTableView.indexPathForRow(at: visiblePoint) else { return }
        if indexPath.row > (presenter.currentCount - (Config.getPageLength() / 2)) {
            if !presenter.isFetching {
                presenter.fetchNewPage()
                self.addFooterView()
            }
        }
    }

}
