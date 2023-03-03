//
//  DetailInteractor.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation
//Desacoplamos la responasbilidad usando Abstracciones
protocol DetailInteractable {
    func getDatailMovie(withId id:String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    
    private let apiKeys: ApiKeysProtocol
    
    init(apiKeys: ApiKeysProtocol) {
        self.apiKeys = apiKeys
    }
    
//    método para hacer la petición HTTP mediante el ID
    func getDatailMovie(withId id:String) async -> DetailMovieEntity {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=\(apiKeys.valueForAPIKey(named: "api_key"))")!
        let (data, response) = try! await URLSession.shared.data(from: url)
        if let httpResponse = response as? HTTPURLResponse{
            if httpResponse.statusCode == 401 {
                print("Invalido el Api Key")
            }else if httpResponse.statusCode == 404 {
                print("No se encontro el recurso")
            }
        }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
        
    }
    
    
}
