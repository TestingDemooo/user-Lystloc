//
//  UserDetailVC.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import UIKit

class UserDetailVC: UIViewController {
    
    @IBOutlet weak var txtfldName: UITextField!
    @IBOutlet weak var txtfldEmail: UITextField!
    @IBOutlet weak var txtfldPhone: UITextField!
    
    var presenter: UserDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presenter?.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.title = "User Detail"
    }
}

// MARK: - Show User Detail

extension UserDetailVC: UserDetailViewProtocol {
    func showUserDetail(obj: UserListModel) {
        self.txtfldName.text = obj.name
        self.txtfldEmail.text = obj.email
        self.txtfldPhone.text = obj.phone
    }
}
