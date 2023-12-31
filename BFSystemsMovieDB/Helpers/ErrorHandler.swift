//
//  ErrorHandler.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import UIKit

class ErrorHandler: NSObject {
    
    static var sharedInstance = ErrorHandler()
    
    private override init() {
        super.init()
    }
    
    func handleError(_ error: Error?, from controller: UIViewController) {
        if let error = error as? InternalError {
            if error == InternalError.decodingError {
                print("Error decoding JSON")
            } else if error == InternalError.urlBuildingError {
                print("Error trying to build query url")
            } else {
                self.showAlertFor(error: error, from: controller)
            }
        } else if let error = error as? Errors {
            if error == Errors.invalidAPIClientKey {
                print("Invalid API Key error")
            } else {
                self.showAlertFor(error: error, from: controller)
            }
        } else {
            self.showAlertFor(error: error, from: controller)
        }
    }
    
    fileprivate func showAlertFor(error: Error?, from controller: UIViewController) {
        var viewModel: AlertViewModel!
        
        if let error = error as? Errors {
            viewModel = AlertViewModel.init(networkErrorModel: error)
            
        } else if let error = error as? InternalError {
            viewModel = AlertViewModel.init(internalErrorModel: error)
        } else {
            if let error = error {
                viewModel = AlertViewModel.init(genericErrorModel: error)
            }
        }
        let alert = UIAlertController.init(title: viewModel.title, message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: NSLocalizedString("ok", comment: "Ok"), style: .default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
    
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
