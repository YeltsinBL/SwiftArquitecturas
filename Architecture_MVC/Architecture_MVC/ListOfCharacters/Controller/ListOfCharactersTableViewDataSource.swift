//
//  ListOfCharactersTableViewDataSource.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

final class ListOfCharactersTableViewDataSource: NSObject, UITableViewDataSource {

//    referencia de la TableView de la vista
    private let tableView: UITableView
//    propiedad del modelo
    private(set) var characters: [CharacterModel] = [] {
        didSet {
            DispatchQueue.main.async {
//                recargamos la TableView
                self.tableView.reloadData()
            }
        }
    }
//    inicializador para poder crearlo desde el ViewController
    init(tableView: UITableView, characters: [CharacterModel] = []) {
        self.tableView = tableView
        self.characters = characters
    }
//    cantidad de elementos que haya en el array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
//    representación visual de la celda
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        recuperamos una celda de la TableView
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterListCellView", for: indexPath) as! CharacterListCellView
//        recuperamos el personaje que debe mostrar en la celda
        let character =  characters[indexPath.row]
//        enviamos la data para setearlo
        cell.configure(character)
        
        return cell
    }
    
//    seteamos el valor de los personajes
    func set(characters: [CharacterModel]) {
        self.characters = characters
    }
}
