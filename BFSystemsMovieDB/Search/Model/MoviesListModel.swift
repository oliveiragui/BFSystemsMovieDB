//
//  MoviesListModel.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

struct MoviesListModel: Codable {
    var page: Int
    var results: [MovieResult]
    var totalPages: Int
}

extension MoviesListModel {
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
    }
}
