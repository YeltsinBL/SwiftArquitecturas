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
    @Published var isEnabled = false
    @Published var showLoading = false
    @Published var errorMessage = ""
    @Published var userModel: User?
    
//    propiedad para poder guardar la referencia cuando nos suscribimos
    var cancellable = Set<AnyCancellable>()
    
//    referencias
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
        
        formValidation()
        
    }
    
    func formValidation() {
//        Combinamos la propiedades para no repetir Lógica
        Publishers.CombineLatest($email, $password)
            .filter { email, password in
                if(email.count <= 5 || password.count <= 5){
                    self.isEnabled = false
                }
                return email.count > 5 && password.count > 5
            }
            .receive(on: DispatchQueue.main)
            .sink { value in
                self.isEnabled = true
                print("Email: \(value)")
            }
            .store(in: &cancellable)
        
        
//        nos suscribimos cuando haya cambios en la propiedad
//        $email
//            .filter { $0.count > 5 } //se ejecutara lo demas si se cumple esta condicion
//            .receive(on: DispatchQueue.main) //que se ejecute esto en el hilo principal
//            .sink { value in
//                self.isEnabled = true
//            print("Email: \(value)")
//        }.store(in: &cancellable) //lo almacenamos en la propiedad
//        $password.sink { value in
//            print("Password: \(value)")
//        }.store(in: &cancellable)
        
    }
    
    @MainActor //para que retorne en el hilo principal
    func userLogin(withEmail email: String,
                   password: String) {
        errorMessage = ""
//        mostrar icon cargando
        showLoading = true
//        se ejecutará el método de forma asíncrona
        Task {
//            usamos el método que puede lanzar errores
            do{
                userModel = try await apiClient.login(withEmail: email, password: password)
                print(userModel ?? "Sin valor")
            } catch let error as BackendError {
                errorMessage = error.rawValue
                print(error.localizedDescription)
            }
            showLoading = false
            
        }
    }
    
}
