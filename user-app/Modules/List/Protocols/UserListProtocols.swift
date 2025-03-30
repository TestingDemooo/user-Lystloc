//
//  UserProtocols.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import Foundation
import UIKit

// MARK: - Router protocol

protocol UserListPresenterRouterProtocol: AnyObject {
    static func createModule() -> UIViewController
    func redirectToDetailVC(from view: UsersListPresenterToViewProtocol, obj: UserListModel)
}

// MARK: - Interactor protocol

protocol UserListPresentorToInteractorProtocol: AnyObject {
    var presenter: UserListInteractorToPresenterProtocol? { get set }
    var userList: [UserListModel]? { get }
    
    func fetchUserList()
}

// MARK: - Presenter protocol

protocol UserListInteractorToPresenterProtocol: AnyObject {
    func getUserList()
    func UserListFetchFailed()
}

// MARK: - View protocol

protocol UsersListViewToPresenterProtocol: AnyObject {
    
    var view: UsersListPresenterToViewProtocol? { get set }
    var interactor: UserListPresentorToInteractorProtocol? { get set }
    var router: UserListPresenterRouterProtocol? { get set }

    func updateUI()
    func getUserListCount() -> Int?
    func getUserList(index: Int) -> UserListModel?
    func showUserDetail(_ obj: UserListModel)

}
protocol UsersListPresenterToViewProtocol: AnyObject {
    func showList()
    func showError()
}
