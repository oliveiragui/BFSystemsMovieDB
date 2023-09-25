//
//  MovieResult.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation
import UIKit

struct MovieResult: Codable {
    var id: Int
    var overview: String
    var posterPath: String?
    var releaseDate: String
    var title: String
}

extension MovieResult {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
    }
}
