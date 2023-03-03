//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

//pasamos el ViewModel a la View
protocol DetailPresenteUI: AnyObject {
    func updateUI(viewModel: DetailMovieViewModel)
}

//protocolo para la Abstracción desde la View
protocol DetailPresentable: AnyObject {
    var ui: DetailPresenteUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailPresenter: DetailPresentable {
    
    weak var ui: DetailPresenteUI?
    
//    referencias
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDatailMovieViewModel
    
//    pasamos la dependencia del Id, el Interactable y el Mapper
    init(movieId: String, interactor: DetailInteractable, mapper: MapperDatailMovieViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
//    obtenemos los datos del Interactor
    func onViewAppear() {
        Task {
            let model = await interactor.getDatailMovie(withId: movieId)
//            pasamos de Entity a ViewModel
            let viewModel = mapper.map(entity: model)
//            pasamos el ViewModel a la UI
            await MainActor.run {
                self.ui?.updateUI(viewModel:viewModel)
                print("Detalle: \(viewModel)")
                
            }
        }
    }
    
    
}
