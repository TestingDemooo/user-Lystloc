//
//  UserListInteractor.swift
//  user-app
//
//  Created by Hema M on 30/03/25.
//

import Foundation
import Alamofire

class UserListInteractor: UserListPresentorToInteractorProtocol {
    
    // MARK: - Properties
    weak var presenter: UserListInteractorToPresenterProtocol?
    var userList: [UserListModel]?
    
    // MARK: - APIs
    
    func fetchUserList() {
        
        AF.request(Constants.URL, method: .get, parameters: [:], encoding: URLEncoding.default).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode([UserListModel].self, from: data)
                    debugPrint(response)
                    self.userList = response
                    self.presenter?.getUserList()

                }catch let error{
                    debugPrint(error)
                }
                break
            case .failure(_):
                self.presenter?.UserListFetchFailed()
                break
            }
            
        }
    }
}
