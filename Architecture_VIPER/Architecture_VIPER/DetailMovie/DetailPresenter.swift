//
//  DetailPresenter.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

class DetailPresenter {
    
//    referencias
    private let movieId: String
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
            print("Detalle: \(viewModel)")
        }
    }
    
    
}
