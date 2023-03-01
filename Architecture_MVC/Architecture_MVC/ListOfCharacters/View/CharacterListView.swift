//
//  CharacterListView.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

class CharacterListView: UIView {
    let charatersTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CharacterListCellView.self, forCellReuseIdentifier: "CharacterListCellView")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(charatersTableView)
        NSLayoutConstraint.activate([
            charatersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            charatersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            charatersTableView.topAnchor.constraint(equalTo: topAnchor),
            charatersTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
