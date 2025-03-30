//
//  ListVC.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import UIKit

class ListVC: UIViewController {
    
    @IBOutlet weak var tblview: UITableView!

    // MARK: - Properties
    var presenter: UsersListViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setupViews()
        presenter?.updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "List"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    // MARK: - Setup Views
    
    fileprivate func setupViews() {
        
        tblview.delegate = self
        tblview.dataSource = self
        tblview.register(UINib(nibName: CellList.nibName, bundle: nil), forCellReuseIdentifier: CellList.cellIdentifier)
        tblview.separatorStyle = .none
        tblview.showsVerticalScrollIndicator = false
    }
}
// MARK: - Tableview delegate & datasource

extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUserListCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellList.cellIdentifier, for: indexPath) as! CellList
        let obj = presenter?.getUserList(index: indexPath.row)
        cell.setupData(strName: obj?.name ?? "", strEmail: obj?.email ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let obj = presenter?.getUserList(index: indexPath.row) else { return  }
        presenter?.showUserDetail(obj)
    }
}
extension ListVC: UsersListPresenterToViewProtocol {
    func showList() {
        tblview.reloadData()
    }
    
    func showError() {
        let alert = UIAlertController(title: "User-App", message: "Error!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
 
