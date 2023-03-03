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
    
    let apiKeys = ApiKeys()
    
//    método para hacer la petición HTTP mediante el ID
    func getDatailMovie(withId id:String) async -> DetailMovieEntity {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api?key=\(apiKeys.valueForAPIKey(named: "api_key"))")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! jsonDecoder.decode(DetailMovieEntity.self, from: data)
        
    }
    
    
}
