//
//  AlertViewModel.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

struct AlertViewModel {
    
    var title: String
    var message: String
        
    init(networkErrorModel: Errors) {
        switch networkErrorModel {
        case .timeout:
            title = "Connection Timeout"
            message = "The connection timed out, please check your internet connection and try again."
        case .secureConnectionFailed:
            title = "Could not establish connection"
            message = "We could not establish a secure connection to the server, please check your internet connection and try again. If the problem persists, please contact support."
        case .badURL:
            title = "Bad URL"
            message = "There is something wrong with the URL you are trying to access. Please try again in a few minutes or contact support if the problem persists."
        case .hostNotFound:
            title = "Server not found"
            message = "We could not establish a connection to the server, please check your internet connection and try again. If the problem persists, please contact support."
        case .lostConnection:
            title = "Lost connection"
            message = "Please check your connection and try again."
        case .resourceNotFound:
            title = "No results found"
            message = "Your search didn't give any results."
        default:
            title = "Unknown error"
            message = "An unknown network error occured, please check your internet connection and try again. If the error persists, please contact support."
        }
    }
    
    init(internalErrorModel: InternalError) {
        switch internalErrorModel {
        case .noDataError:
            title = "Not found"
            message = "Your request did not return any data."
            
        default:
            title = "Unknown error"
            message = "An unknown internal error occured, please check your internet connection and try again. If the error persists, please contact support."
        }
    }
    
    init(genericErrorModel: Error) {
        if let error = genericErrorModel as NSError? {
            switch error.code {
            
            default:
                title = "Unknown error"
                message = "An unknown internal error occured, please check your internet connection and try again. If the error persists, please contact support."
            }
        } else {
            title = "There was an error"
            message = genericErrorModel.localizedDescription
        }
    }
}

