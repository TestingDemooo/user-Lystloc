//
//  CellList.swift
//  user-app
//
//  Created by Hema M on 29/03/25.
//

import UIKit

class CellList: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var viewBg: UIView!
    
    static var cellIdentifier:String = {
        return "CellList"
    }()
    static var nibName:String = {
        return "CellList"
    }()

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundView?.backgroundColor = .clear
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.selectionStyle = .none
        
        self.setupViews()
    }

    // MARK: - Setup Data
    
    func setupData(strName: String, strEmail: String) {
        lblName.text = strName
        lblEmail.text = strEmail
    }

    // MARK: - Setup views
    
    fileprivate func setupViews() {
        
        viewBg.layer.cornerRadius = 10.0
        viewBg.layer.borderColor = UIColor.clear.cgColor
        viewBg.layer.borderWidth = 1.0
        
        lblName.numberOfLines = 0
        
        lblEmail.numberOfLines = 0
    }
}
