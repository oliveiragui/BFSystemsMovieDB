//
//  SearchViewModelProtocol.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation

protocol SearchViewControllerDelegate: AnyObject {
    func openMovieDetail(movie: MovieResult)
    func queryMovies(query: String, page: Int)
    func fetchSavedMovies(page: Int)
}

protocol SearchViewModelProtocol: AnyObject {
    func openMovieDetail(movie: MovieResult)
    func queryMovies(query: String, page: Int)
    func fetchSavedMovies(page: Int)
    func setupView(viewDelegate: SearchViewModelToControllerDelegate)
}

protocol SearchViewNavigationHandler: AnyObject {
    func openMovieDetail(movie: MovieResult)
}

protocol SearchViewModelToControllerDelegate: AnyObject {
    func setup(movies: MoviesListModel)
    func startLoading()
    func stopLoading()
}

protocol SearchViewDelegate: AnyObject {
    func setup(movies: MoviesListModel)
    func startLoading()
    func stopLoading()
}
