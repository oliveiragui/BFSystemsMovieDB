//
//  NetworkDispatcher.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public typealias NetworkDispatcherCompletion = (_ data: Data?,_ response: URLResponse?,_ error: Error?)->()

protocol NetworkDispatcher: AnyObject {
    associatedtype EndPoint: EndPointType
    
    func request(_ route: EndPoint, completion: @escaping NetworkDispatcherCompletion)
    func cancel()
}
