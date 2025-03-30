//
//  UserDetailProtocols.swift
//  user-app
//
//  Created by Hema M on 30/03/25.
//

import Foundation
import UIKit

// MARK: - Router protocol

protocol UserDetailRouterProtocol: AnyObject {
    static func redirectToDetailRouterModule(with obj: UserListModel) -> UIViewController
}

// MARK: - Presenter protocol

protocol UserDetailPresenterProtocol: AnyObject {
    
    var view: UserDetailViewProtocol? { get set }
    var interactor: UserDetailInteractorInputProtocol? { get set }
    var router: UserDetailRouterProtocol? { get set }
    
    func viewDidLoad()
}
// MARK: - View protocol

protocol UserDetailViewProtocol: AnyObject {
    
    var presenter: UserDetailPresenterProtocol? { get set }
    func showUserDetail(obj: UserListModel)

}
// MARK: - Interactor protocol

protocol UserDetailInteractorInputProtocol: AnyObject {
    
    var userItem: UserListModel? { get set }
    
}
