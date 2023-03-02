//
//  ListOfMoviesInteractor.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation

class ListOfMoviesInteractor {
    
    func valueForAPIKey(named keyname:String) -> String {
        // 1
        guard let filePath = Bundle.main.path(forResource: "ApiKeys", ofType: "plist") else {
            fatalError("No se pudo encontrar el archivo 'keys.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: keyname) as? String else {
            fatalError("No se pudo encontrar la clave 'api_key' en 'keys.plist'.")
        }
        // 3
        if (value.starts(with: "_")) {
            fatalError("La clave está vacía")
        }
        return value
    }
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(valueForAPIKey(named: "api_key"))")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}
