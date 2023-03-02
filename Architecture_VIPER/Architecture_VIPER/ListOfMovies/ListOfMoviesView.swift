//
//  ListOfMoviesView.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
    
//    hacemos una referencia al Presenter
    var presenter: ListOfMoviesPresenter?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
//        llamamos al metodo del presenter
        presenter?.onViewAppear()
    }
    
}

//conformar el protocolo del Presenter
extension ListOfMoviesView: ListOfMoviesUI {
//    pasamos los datos a la View
    func update(movies: [PopularMovieEntity]) {
        print("Datos Recibidos \(movies)")
    }
}
