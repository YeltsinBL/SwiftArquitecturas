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
    
//    creamos la referencia del Mapper, lo inyectamos al Presenter e instanciamos
    private let movieCellMapper: MovieCellMapper
    
    init(listOfMoviesIteractor: ListOfMoviesInteractor, movieCellMapper: MovieCellMapper = MovieCellMapper()) {
        self.listOfMoviesIteractor = listOfMoviesIteractor
        self.movieCellMapper = movieCellMapper
    }
    
//    llamamos al Interactor y lo pasamos a la View con el patron Delegation
    func onViewAppear(){
        Task {
//            obtenemos los datos
            let models = await listOfMoviesIteractor.getListOfMovies().results
//            transformamos de Entity a ViewModel mapeándolo
            moviewCelViewModels = models.map(movieCellMapper.map(entity:))
//            lo pasamos a View mediante un protocolo
            ui?.update(movies: moviewCelViewModels)
        }
    }
    
}
