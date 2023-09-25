//
//  SearchViewModel.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

class SearchViewModel: SearchViewModelProtocol {
    
    weak var navigationHandler: SearchViewNavigationHandler?
    weak var viewDelegate: SearchViewModelToControllerDelegate?
    private let searchManager: SearchManagerProtocol
    
    init(manager: SearchManagerProtocol, navigationHandler: SearchViewNavigationHandler) {
        self.navigationHandler = navigationHandler
        self.searchManager = manager
    }
    
    func queryMovies(query: String, page: Int) {
        self.viewDelegate?.startLoading()
        
        searchManager.searchMovies(query: query, page: page) { [weak self] result in
            switch result {
            case .Success(let response):
                self?.viewDelegate?.setup(movies: response)
            case .Failure(let error):
                
                guard let self = self else { return }
                
                guard let vc = self.viewDelegate as? UIViewController else { return }
                
                DispatchQueue.main.async { [weak self] in
                    self?.viewDelegate?.stopLoading()
                }
                
                ErrorHandler.sharedInstance.handleError(error, from: vc)
            }
        }
    }
    
    func fetchSavedMovies(page: Int) {
        searchManager.fetchSavedMovies(page: page) { [weak self] result in
            switch result {
            case .Success(let response):
                self?.viewDelegate?.setup(movies: response)
                self?.viewDelegate?.stopLoading()
            case .Failure(let error):
                
                guard let self = self else { return }
                
                guard let vc = self.viewDelegate as? UIViewController else { return }
                
                ErrorHandler.sharedInstance.handleError(error, from: vc)
            }
        }
    }
    
    func openMovieDetail(movie: MovieResult) {
        self.navigationHandler?.openMovieDetail(movie: movie)
    }
    
    func setupView(viewDelegate: SearchViewModelToControllerDelegate) {
        self.viewDelegate = viewDelegate
    }
}
