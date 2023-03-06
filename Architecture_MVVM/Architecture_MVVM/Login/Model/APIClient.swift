//
//  APIClient.swift
//  Architecture_MVVM
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

enum BackendError: String, Error {
    case invalidEmail = "Comprueba el Email"
    case invalidPassword = "Comprueba tu password"
}

final class APIClient {
    
    func login(withEmail email: String, password: String) async throws -> User {
//        Simulando la petición HTTP y esperar 2 segundos
        try await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return try simulateBackendLogic(email: email, password: password)
    }
}

//esta parte debería de estar en el Backend
func simulateBackendLogic(email: String, password: String) throws -> User {
    guard email == "exercisewithmvvm" else {
        print("El usuario no es exercisewithMVVM")
        throw BackendError.invalidEmail
    }
    guard password == "1234567890" else {
        print("La password no es 1234567890")
        throw BackendError.invalidPassword
    }
    print("Success")
    return .init(name: "exercisewithMVVM",
                 token: "token_123456789",
                 sessionStart: .now)
}
