//
//  Errors.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public enum Errors: Error {
    case parametersNil
    case encodingFailed
    case decodingFailed
    case missingURL
    case wrongURL
    case lostConnection
    case notFound
    case saveError
    case unknownError
    case timeout
    case secureConnectionFailed
    case badURL
    case hostNotFound
    case resourceNotFound
    case invalidAPIClientKey
    case serviceError
    
    func convertNSURLError(_ error: Error) -> Errors {
        if let error = error as NSError? {
            switch error.code {
            case NSURLErrorTimedOut:
                return .timeout
            case NSURLErrorNotConnectedToInternet, NSURLErrorNetworkConnectionLost:
                return .lostConnection
            case NSURLErrorSecureConnectionFailed:
                return .secureConnectionFailed
            case NSURLErrorBadURL:
                return .badURL
            case NSURLErrorCannotFindHost:
                return .hostNotFound
            case NSURLErrorCannotDecodeRawData, NSURLErrorCannotParseResponse, NSURLErrorCannotDecodeContentData:
                return .decodingFailed
            default:
                return .unknownError
            }
        }
    }
}
