//
//  MoviesDBService.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

protocol SearchManagerProtocol {
    func searchMovies(query: String, page: Int, completion: @escaping (Result<MoviesListModel>) -> Void)
    func fetchSavedMovies(page: Int, completion: @escaping (Result<MoviesListModel>) -> Void)
}

class SearchManager: SearchManagerProtocol {
    
    let moviesContext = DatabaseService()
    
    func fetchSavedMovies(page: Int, completion: @escaping (Result<MoviesListModel>) -> Void) {
        let savedMovies = moviesContext.fetch()
        
        if !savedMovies.isEmpty {
            let model = MoviesListModel(page: 1, results: savedMovies, totalPages: 1)
            completion(Result.Success(model))
        }
    }
    
    func searchMovies(query: String, page: Int, completion: @escaping (Result<MoviesListModel>) -> Void) {
        
        manager.dispatcher.request(.search(query: query, page: page)) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    let networkError = ErrorHandler.sharedInstance.convertNSURLError(error)
                    completion(Result.Failure(networkError))
                }
                
                guard let response = response as? HTTPURLResponse else {
                    completion(Result.Failure(Errors.decodingFailed))
                    return
                }
                
                let result = self.manager.handleNetworkResponse(response)
                
                switch result {
                case .Success:
                    let jsonDecoder = JSONDecoder()
                    if let data = data,
                       let info = try? jsonDecoder.decode(MoviesListModel.self, from: data) {
                        if info.results.isEmpty {
                            completion(Result.Failure(Errors.resourceNotFound))
                        }
                        self.moviesContext.add(movies: info.results)
                        completion(Result.Success(info))
                    }
                case .Failure(let error):
                    print(error.localizedDescription)
                    if let _ = error as? NetworkManager<MoviesDBAPI>.NetworkResponse {
                        completion(Result.Failure(Errors.secureConnectionFailed))
                    }
                    completion(Result.Failure(error))
                }
            }
        }
    }
}

extension SearchManager: Service {
    typealias EndPoint = MoviesDBAPI
}

extension SearchManager: Gettable { }
