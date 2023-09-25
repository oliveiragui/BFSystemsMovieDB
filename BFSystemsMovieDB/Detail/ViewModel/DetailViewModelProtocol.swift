//
//  DetailViewModelProtocol.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation

protocol DetailViewControllerDelegate: AnyObject {
}

protocol DetailViewModelProtocol: AnyObject {
    func setupView(viewDelegate: DetailViewModelToControllerDelegate)
}

protocol DetailViewNavigationHandler: AnyObject {}

protocol DetailViewModelToControllerDelegate: AnyObject {
    func setup(movie: MovieResult)
}

protocol DetailViewDelegate: AnyObject {
    func setup(movie: MovieResult)
}
