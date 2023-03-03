//
//  ListOfMoviesPresenter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
//    Creamos una abstraccion: dos metodos y una propiedad que necesita la view
    var ui: ListOfMoviesUI? { get }
    var moviewCelViewModels: [MovieCellViewModel] { get }
    func onViewAppear()
}
//para pasar los datos a la View
protocol ListOfMoviesUI: AnyObject {
    func update(movies: [MovieCellViewModel])
}
//hacemos que conforme el protocolo
class ListOfMoviesPresenter: ListOfMoviesPresentable {
//    referencia del protocolo usando el 'weak' para evitar Retail Circle
    weak var ui: ListOfMoviesUI?
    
//    referencia del Interactor
//    private let listOfMoviesIteractor: ListOfMoviesInteractor
//    referencia del protocolo del Interactor- Aquí se está haciendo la Abstracción
    private let listOfMoviesIteractor: ListOfMoviesInteractable
//    guardamos la referencia del array del Json
    var moviewCelViewModels: [MovieCellViewModel] = []
    
//    creamos la referencia del Mapper, lo inyectamos al Presenter e instanciamos
    private let movieCellMapper: MovieCellMapper
    
    init(listOfMoviesIteractor: ListOfMoviesInteractable, movieCellMapper: MovieCellMapper = MovieCellMapper()) {
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
