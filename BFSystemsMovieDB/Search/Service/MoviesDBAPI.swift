//
//  MoviesDBAPI.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

enum MoviesDBAPI {
    case search(query: String, page: Int = 1)
}

extension MoviesDBAPI: EndPointType {
    var apiClientKey: String? {
        return "b73d015592987cd83d6a9abb39b46b0c"
    }
    
    var apiClientSecret: String? {
        return nil
    }
    
    var baseURLString : String {
        return "https://api.themoviedb.org/3/"
    }
    
    var baseURL: URL {
        guard let url = URL(string: baseURLString) else {
            fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        
        case .search:
            return "search/movie"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {

        case .search(let query, let page):
            let urlParameters: Parameters = ["query": query,
                                             "page": page,
                                             "api_key": apiClientKey ?? ""]
            return .requestWith(bodyParameters: nil, urlParameters: urlParameters)
        }
    }
    
    var headers: HTTPHeader? {
        switch self {
            
        default:
            return nil
        }
    }
}
