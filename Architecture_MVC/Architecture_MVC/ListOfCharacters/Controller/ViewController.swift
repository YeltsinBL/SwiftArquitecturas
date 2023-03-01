//
//  ViewController.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import UIKit

class ViewController: UIViewController {
//    Llamamos a la vista principal
    var mainView: CharacterListView { self.view as! CharacterListView}
//    Lamamos para hacer las peticiones
    var apiClient = ListOfCharacterAPIClient()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Cuando la vista se haya cargado, hacemos la petición HTTP
        Task {
            let characters = await apiClient.getListOfCharacter()
            print("Characters \(characters)")
        }
        
    }

    override func loadView() {
//        Creamos la instancia
        view = CharacterListView()
    }

}

