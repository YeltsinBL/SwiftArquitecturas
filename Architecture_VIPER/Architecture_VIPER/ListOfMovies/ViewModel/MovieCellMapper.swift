//
//  MovieCellMapper.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 2/03/23.
//

import Foundation

struct MovieCellMapper {
//    método para quitar la responsabilidad al Presenter de transformar el Entity al ViewModel
    func map(entity: PopularMovieEntity) -> MovieCellViewModel {
        MovieCellViewModel(title: entity.title, overview: entity.overview, imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
    
}
