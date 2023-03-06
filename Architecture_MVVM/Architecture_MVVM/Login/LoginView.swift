//
//  ViewController.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import UIKit
import Combine

class LoginView: UIViewController {

//    referencia
    private let loginViewModel = LoginViewModel(apiClient: APIClient())
//    propiedad para usar con el Combine
    var cancellable = Set<AnyCancellable>()
    
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
        textField.isSecureTextEntry = true
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
    
    private let errorLabel: UILabel = {
       var label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textColor = .red
        label.font = .systemFont(ofSize: 20, weight: .regular, width: .condensed)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        primero debe hacer el Binding y luego la vista
        createBindingViewWithViewModel()
        
        [emailTextFiel, passwordTextFiel, loginButton, errorLabel]
            .forEach(view.addSubview)
        
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
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant:  20)
            
        ])
    }
    
    private func startLogin(){
        loginViewModel.userLogin(withEmail: emailTextFiel.text?.lowercased() ?? "",
                                 password: passwordTextFiel.text?.lowercased() ?? "")
    }

//    creación de los Binding para la conexión con las propiedad desl ViewModel
    func createBindingViewWithViewModel() {
//        siempre que se use '.assign', se debe usar 'store'
        emailTextFiel.textPublisher
//              especificamos el Binding con el ViewModel y su propiedad
            .assign(to: \LoginViewModel.email,
                    on: loginViewModel) //con su instancia
            .store(in: &cancellable) //guardamos siempre la referencia en un tipo AnyCancellable
        passwordTextFiel.textPublisher
            .assign(to: \LoginViewModel.password,
                    on: loginViewModel)
            .store(in: &cancellable)
//        Bindeamos la propiedad del ViewModel con el Button
        loginViewModel.$isEnabled
//        nos conectamos a la propiedad 'isEnabled' del Button
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &cancellable)
//        Bindeamos para mostrar el loading icon del Button
        loginViewModel.$showLoading
            .assign(to: \.configuration!.showsActivityIndicator, on: loginButton)
            .store(in: &cancellable)
//        actualizamos el texto del Label
        loginViewModel.$errorMessage
            .assign(to: \UILabel.text!, on: errorLabel)
            .store(in: &cancellable)
        
//        usamos la propiedad del ViewModel para poder mostrar el HomeView
        loginViewModel.$userModel.sink { [weak self] _ in
            print("Navego hacia el HomeViewcontroller")
            let homeView = HomeView()
            self?.present(homeView, animated: true)
        }.store(in: &cancellable)
        
    }
    

}

//para detectar los cambios en los textFields
extension UITextField {
    var textPublisher: AnyPublisher<String, Never> {
//        detectamos cuando se esta añadiendo nuevo texto en el TextField
        return NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self)
            .map { notification in
//                nos quedamos con el texto que llega de la notificación
                return (notification.object as? UITextField)?.text ?? ""
            }
//              publica una notificación cada ves que se cambia el valor del UITextField
            .eraseToAnyPublisher()
    }
}
