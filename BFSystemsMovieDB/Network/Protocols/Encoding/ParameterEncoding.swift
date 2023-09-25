//
//  ParameterEncoding.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public typealias Parameters = [String : Any]

public protocol ParameterEncoder {
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}
