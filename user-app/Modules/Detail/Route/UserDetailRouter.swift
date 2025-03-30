//
//  UserDetailRouter.swift
//  user-app
//
//  Created by Hema M on 30/03/25.
//

import Foundation
import UIKit


class UserDetailRouter: UserDetailRouterProtocol {
    
    // MARK: - Redirection

    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func redirectToDetailRouterModule(with obj: UserListModel) -> UIViewController {
        let vc = storyboard.instantiateViewController(withIdentifier: "UserDetailVC") as! UserDetailVC
        
        let presenter: UserDetailPresenterProtocol  = UserDetailPresenter()
        let interactor: UserDetailInteractorInputProtocol = UserDetailInteractor()
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interactor
        interactor.userItem = obj
        return vc
    }
}



