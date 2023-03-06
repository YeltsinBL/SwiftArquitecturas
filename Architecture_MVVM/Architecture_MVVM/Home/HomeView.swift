//
//  HomeView.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 6/03/23.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    private let messageLabel: UILabel = {
        var label = UILabel()
        label.numberOfLines = 0
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold, width: .standard)
        label.text = "Bienvenido al Home"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -60),
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
        
    }
    
}
