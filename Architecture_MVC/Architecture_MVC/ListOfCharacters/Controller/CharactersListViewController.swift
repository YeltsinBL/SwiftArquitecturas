//
//  CharactersListViewController.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import UIKit

class CharactersListViewController: UIViewController {
//    Llamamos a la vista principal
    var mainView: CharacterListView { self.view as! CharacterListView}
//    Lamamos para hacer las peticiones
    var apiClient = ListOfCharacterAPIClient()
    
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?

    override func loadView() {
//        Creamos la instancia
        view = CharacterListView()
//        instanciamos
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        
//        instanciamos y pasamos la TableView que necesita el DataSource
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charatersTableView)
//        indicamos que el DataSource de la vista es la instancia creada
        mainView.charatersTableView.dataSource = tableViewDataSource
        mainView.charatersTableView.delegate = tableViewDelegate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Cuando la vista se haya cargado, hacemos la petición HTTP
        Task {
            let characters = await apiClient.getListOfCharacter()
            print("Characters \(characters)")
//            Después de obtener la información de la petición, lo pasamos al DataSource
            tableViewDataSource?.set(characters: characters.results)
        }
        
    }


}

