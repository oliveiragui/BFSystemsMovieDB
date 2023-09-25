//
//  InternalError.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

enum InternalError: Error {
    case decodingError
    case noDataError
    case urlBuildingError
    case validationError
    case unknownError
}
