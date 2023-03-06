//
//  LoginViewModel.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation
import Combine

class LoginViewModel {
//    Property Wrappers
    @Published var email = ""
    @Published var password = ""
//    propiedad para poder guardar la referencia cuando nos suscribimos
    var cancellable = Set<AnyCancellable>()
    
//    referencias
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        
        formValidation()
        
    }
    
    func formValidation() {
//        nos suscribimos cuando haya cambios en la propiedad
        $email.sink { value in
            print("Email: \(value)")
        }.store(in: &cancellable) //lo almacenamos en la propiedad
        $password.sink { value in
            print("Password: \(value)")
        }.store(in: &cancellable)
        
    }
    
    @MainActor //para que retorne en el hilo principal
    func userLogin(withEmail email: String,
                   password: String) {
//        se ejecutará el método de forma asíncrona
        Task {
//            usamos el método que puede lanzar errores
            do{
                let userModel = try await apiClient.login(withEmail: email, password: password)
                print(userModel)
            } catch let error as BackendError {
                print(error.localizedDescription)
            }
            
        }
    }
    
}
