//
//  UserDetailPresenter.swift
//  user-app
//
//  Created by Hema M on 30/03/25.
//

import Foundation
import UIKit

class UserDetailPresenter: UserDetailPresenterProtocol {
    weak var view: UserDetailViewProtocol?
    var router: UserDetailRouterProtocol?
    var interactor: UserDetailInteractorInputProtocol?

    func viewDidLoad() {
        if let item = interactor?.userItem {
            view?.showUserDetail(obj: item)
        }
    }
}
