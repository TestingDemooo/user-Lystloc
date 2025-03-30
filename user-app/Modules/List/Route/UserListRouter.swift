//
//  UserListRouter.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import Foundation
import UIKit

class UserListRouter: UserListPresenterRouterProtocol {
    
    static var storyboard: UIStoryboard{
        return UIStoryboard(name:"Main",bundle: .main)
    }

    // MARK: - RedirectTo List VC

    static func createModule() -> UIViewController {
        
        let vc = storyboard.instantiateViewController(withIdentifier: "ListVC") as! ListVC
        let navigation = UINavigationController(rootViewController: vc)
        let presenter: UsersListViewToPresenterProtocol & UserListInteractorToPresenterProtocol = UserListPresenter()
        let interactor: UserListPresentorToInteractorProtocol = UserListInteractor()
        let router: UserListPresenterRouterProtocol = UserListRouter()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        return navigation
    }
    
    // MARK: - RedirectTo Detail VC

    func redirectToDetailVC(from view: UsersListPresenterToViewProtocol, obj: UserListModel) {
        
        let detailVC = UserDetailRouter.redirectToDetailRouterModule(with: obj)
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View")
        }
        viewVC.navigationController?.pushViewController(detailVC, animated: true)
    }
}
