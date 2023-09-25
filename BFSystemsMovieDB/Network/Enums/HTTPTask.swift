//
//  HTTPTask.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public typealias HTTPHeader = [String : String]

public enum HTTPTask {
    case request
    case requestWith(bodyParameters: Parameters?, urlParameters: Parameters?)
    case requestWithHeaders(bodyParameters: Parameters?, urlParameters: Parameters?, additionalHeaders: HTTPHeader?)
    
}
