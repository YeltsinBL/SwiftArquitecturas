//
//  DetailMovieEntity.swift
//  Architecture_VIPER
//
//  Created by YeltsinMacPro13 on 3/03/23.
//

import Foundation

struct DetailMovieEntity: Decodable {
    let title: String
    let overview: String
    let backdropPath: String
    let status: String
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
}
