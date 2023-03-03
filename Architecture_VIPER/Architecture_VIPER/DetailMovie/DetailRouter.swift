//
//  DetailRouter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String)
}

class DetailRouter: DetailRouting {
//    unimos los módulos de VIPER
//    pasamos la referencia de la Vista anterior a esta, la principal
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String) {
//        instancias
        let apiKey = ApiKeys()
        let interactor = DetailInteractor(apiKeys: apiKey)
        let presenter = DetailPresenter(movieId: movieId, interactor: interactor, mapper: MapperDatailMovieViewModel())
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
        
    }
}
