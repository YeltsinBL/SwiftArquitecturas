//
//  LoginViewModel.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

class LoginViewModel {
    
//    referencias
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
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
