//
//  EndPointType.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public protocol EndPointType {
    var apiClientKey: String? { get }
    var apiClientSecret: String? { get }
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeader? { get }
}
