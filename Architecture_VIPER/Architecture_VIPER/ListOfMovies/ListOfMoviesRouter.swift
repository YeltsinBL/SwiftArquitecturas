//
//  ListOfMoviesRouter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
//    referencias
    var detailRouting: DetailRouting?
    var listOfMoviesView: ListOfMoviesView?
    
//    llamamos a este método desde el punto de entrada de la aplicación 'SceneDelegate'
    func showListOfMovies(window: UIWindow?) {
/*        presentamos el primero módulo de VIPER sin el storyboard */
        
        let apiKeys = ApiKeys()
        
        let interactor = ListOfMoviesInteractor(apiKeys: apiKeys)
//        creamos una instancia del InteractoMock, que llenara de datos sin hacer petición HTTP
//        let interactor = ListOfMoviesInteractorMock()
//        instancia del Presenter y le inyectamos la depencia del Interactor
        let presenter = ListOfMoviesPresenter(listOfMoviesIteractor: interactor)//        unimos el Presenter con la View

//        instanciamos la View
        listOfMoviesView = ListOfMoviesView(presenter: presenter)
//        la 'ui' es la view donde se va a enviar los datos recibidos del Interactor para mostrarlo en pantalla
        presenter.ui = listOfMoviesView
        
//        a la view le pasamos el presenter que necesita para lanzar la accion
//        view.presenter = presenter
        
//        mostramos en pantalla
        window?.rootViewController = listOfMoviesView
        window?.makeKeyAndVisible()
    }
    
//    método para mostrar el detalle
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = listOfMoviesView else { return  }
        detailRouting?.showDetail(fromViewController: fromViewController, withMovieId: movieId)
    }
    
}
