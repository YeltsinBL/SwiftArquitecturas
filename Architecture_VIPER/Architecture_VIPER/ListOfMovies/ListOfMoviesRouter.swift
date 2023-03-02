//
//  ListOfMoviesRouter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
//    llamamos a este metodo desde el punto de entrada de la aplicacion 'SceneDelegate'
    func showListOfMovies(window: UIWindow?) {
/*        presentamos el primero modulo de VIPER sin el storyboard */
//        instanciamos la View
        let view = ListOfMoviesView()
        
        let interactor = ListOfMoviesInteractor()
//        instancia del Presenter y le inyectamos la depencia del Interactor
        let presenter = ListOfMoviesPresenter(listOfMoviesIteractor: interactor)
//        unimos el Presenter con la View
//        la 'ui' es la view donde se va a enviar los datos recibidos del Interactor para mostrarlo en pantalla
        presenter.ui = view
//        a la view le pasamos el presenter que necesita para lanzar la accion
        view.presenter = presenter
        
//        mostramos en pantalla
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
