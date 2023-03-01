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
        
//        obtenemos el index de la celda pulsada
        tableViewDelegate?.didTapOnCell = { [weak self] index in
//            presentar la nueva subvista
            guard let dataSource = self?.tableViewDataSource else { return }
//            obtenemos el modelo a partir del Array del DataSource
            let characterModel = dataSource.characters[index]
//            inicializamos la vista del detalle con el modelo
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
//            esta responsabilidad de hacer la navegación al detalle, se debe de hacer en otra clase, para ello se usa los 'Coordinators'
            self?.present(characterDetailViewController, animated: true)
        }
        
//        Cuando la vista se haya cargado, hacemos la petición HTTP
        Task {
            let characters = await apiClient.getListOfCharacter()
            print("Characters \(characters)")
//            Después de obtener la información de la petición, lo pasamos al DataSource
            tableViewDataSource?.set(characters: characters.results)
        }
        
    }


}

