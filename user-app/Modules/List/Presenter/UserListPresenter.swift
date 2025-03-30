//
//  UserListPresenter.swift
//  user-app
//
//  Created by Hema M on 30/03/25.
//

import Foundation
import UIKit

class UserListPresenter: UsersListViewToPresenterProtocol {

    // MARK: - Properties
    weak var view: UsersListPresenterToViewProtocol?
    var interactor: UserListPresentorToInteractorProtocol?
    var router: UserListPresenterRouterProtocol?

    // MARK: - Methods
    func updateUI() {
        interactor?.fetchUserList()
    }
    func getUserListCount() -> Int? {
        return interactor?.userList?.count
    }
    func getUserList(index: Int) -> UserListModel? {
        return interactor?.userList?[index]
    }
    func showUserDetail(_ obj: UserListModel) {
        guard let view = view else { return }
        router?.redirectToDetailVC(from: view, obj: obj)
    }
}

// MARK: - UserListInteractorToPresenterProtocol
extension UserListPresenter: UserListInteractorToPresenterProtocol {
    func getUserList() {
        view?.showList()
    }
    func UserListFetchFailed() {
        view?.showError()
    }
}
