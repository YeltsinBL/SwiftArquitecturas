//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation

//para pasar los datos a la View
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [MovieCellViewModel])
}

class ListOfMoviesPresenter {
//    referencia del protocolo
    var ui: ListOfMoviesUI?
    
//    referencia del Interactor
    private let listOfMoviesIteractor: ListOfMoviesInteractor
//    guardamos la referencia del array del Json
    var moviewCelViewModels: [MovieCellViewModel] = []
    
    init(listOfMoviesIteractor: ListOfMoviesInteractor) {
        self.listOfMoviesIteractor = listOfMoviesIteractor
    }
    
//    llamamos al Interactor y lo pasamos a la View con el patron Delegation
    func onViewAppear(){
        Task {
//            obtenemos los datos
            let models = await listOfMoviesIteractor.getListOfMovies().results
//            transformamos de Entity a ViewModel mapeándolo
            moviewCelViewModels = models.map { entity in
                MovieCellViewModel(title: entity.title, overview: entity.overview, imageURL: entity
                    .imageURL)
            }
//            lo pasamos a View mediante un protocolo
            ui?.update(movies: moviewCelViewModels)
        }
    }
    
}
