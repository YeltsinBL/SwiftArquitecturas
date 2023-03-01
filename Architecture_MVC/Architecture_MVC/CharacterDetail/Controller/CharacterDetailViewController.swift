//
//  CharacterDetailViewController.swift
//  Architecture_MVC
//
//  Created by YeltsinMacPro13 on 1/03/23.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
//    Llamamos a la subvista principal
    var mainView: CharacterDetailView { self.view as! CharacterDetailView}

//    recibe un modelo para que sepa como representarse en esta subvista
//    lo ideal es pasarlo in 'Id' del modelo y que llame al 'apiClient' para obtener la información del personaje
//    este modelo es el mismo del 'apiClient' y la buena practica es no utilizar el mismo modelo que llega del apiClient en las capas superiores
    init(characterDetailModel: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
//        pasamos el parametro directamente a la subvista
        mainView.configure(characterDetailModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
//        Creamos la instancia
        view = CharacterDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
