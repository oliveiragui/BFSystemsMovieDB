//
//  Result.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public enum Result<T> {
    case Success(T)
    case Failure(Error)
}
