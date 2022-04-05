//
//  UsersListViewController.swift
//  RandomUser-Inc.
//
//  Created by Pol Valls Ortiz on 5/4/22.
//

import Foundation
import UIKit

protocol UsersListView: BaseView {
    func setUsers(users: [User])
}

class UsersListViewController: BaseViewController<UsersListPresenter> {

    // MARK: Outlets
    @IBOutlet weak var usersTableView: UITableView!

    // MARK: Private variables
    private var users: [User]?

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
    }

}

extension UsersListViewController: UsersListView, UITableViewDelegate, UITableViewDataSource {

    func setUsers(users: [User]) {
        self.users = users
        usersTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let users = users {
            return users.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable:next line_length
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: UsersListTableViewCell.self), for: indexPath) as? UsersListTableViewCell,
              let user = users?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.setup(model: UsersListTableViewCellViewModel(user: user))
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

}
