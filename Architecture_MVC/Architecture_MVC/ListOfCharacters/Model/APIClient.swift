//
//  APIClient.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation

final class ListOfCharacterAPIClient {
//    obtenemos los datos que se visualizarán en la aplicación
    func getListOfCharacter() async  -> CharacterModelResponse {
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
