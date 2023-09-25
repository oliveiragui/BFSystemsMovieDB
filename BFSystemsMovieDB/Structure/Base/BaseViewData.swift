//
//  BaseViewData.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation

public protocol BaseViewData { }

public struct EmptyModel: BaseViewData { }

extension Optional: BaseViewData where Wrapped: BaseViewData { }

public protocol UpdatableModel {
    
    associatedtype M: BaseViewData
    
    var model: M { get set }

    func didUpdateModel()
}
