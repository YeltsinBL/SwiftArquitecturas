//
//  MapperDatailMovieViewModel.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

struct MapperDatailMovieViewModel {
//    transforma la entity al viewmodel
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
