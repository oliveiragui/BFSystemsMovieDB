//
//  Service.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 23/09/23.
//

import Foundation

public protocol Service {
    associatedtype EndPoint: EndPointType
}

extension Service {
    public var manager: NetworkManager<EndPoint> {
        return NetworkManager<EndPoint>()
    }
    
}
