//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation

//protocolo que se implementara en 2 interactors: Peticion HTTP y Datos Mockeados
protocol ListOfMoviesInteractable: AnyObject {
//    creamos una interfaz - un contrato
    func getListOfMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    
    private let apiKeys: ApiKeysProtocol
    
    init(apiKeys: ApiKeysProtocol) {
        self.apiKeys = apiKeys
    }
    
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(apiKeys.valueForAPIKey(named: "api_key"))")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}

// en vez de realizar una petición HTTP, retornará un array de modelos inventados
class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
//        implementamos el contenido que conforme el modelo Entity
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "SwiftUI", overview: "Apremder Swift", imageURL: "", votes: 10),
            .init(id: 1, title: "SwiftUI", overview: "Apremder SwiftUI", imageURL: "", votes: 10),
            .init(id: 2, title: "SwiftUI", overview: "Apremder Xcode", imageURL: "", votes: 10),
            .init(id: 3, title: "SwiftUI", overview: "Apremder UIKit", imageURL: "", votes: 10)
        ])
    }
}
