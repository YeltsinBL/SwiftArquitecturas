//
//  ViewController.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import UIKit

class LoginView: UIViewController {

//    referencia
    private let loginViewModel = LoginViewModel(apiClient: APIClient())
    
//    UI
    private let emailTextFiel: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Ingresa tu Email"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextFiel: UITextField = {
       let textField = UITextField()
        textField.placeholder = "Ingresa tu password"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Iniciar Sesión"
        configuration.subtitle = "Ejercicio con MVVM"
        configuration.image = UIImage(systemName: "play.circle.fill")
        configuration.imagePadding = 8
        
        let button = UIButton(type: .system, primaryAction: UIAction(handler: { [weak self] action in
            self?.startLogin()
        }))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = configuration
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [emailTextFiel, passwordTextFiel, loginButton].forEach(view.addSubview)
        
        NSLayoutConstraint.activate([
            
            emailTextFiel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTextFiel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            emailTextFiel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -32),
            emailTextFiel.bottomAnchor.constraint(equalTo: passwordTextFiel.topAnchor, constant: -20),
            
            passwordTextFiel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextFiel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            passwordTextFiel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            passwordTextFiel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func startLogin(){
        loginViewModel.userLogin(withEmail: emailTextFiel.text?.lowercased() ?? "",
                                 password: passwordTextFiel.text?.lowercased() ?? "")
    }


}

