//
//  ViewCode.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import Foundation

public protocol ViewCode {
    func loadView()
    func addSubviews()
    func addConstraints()
}

public extension ViewCode {
    func loadView() {
        addSubviews()
        addConstraints()
    }
}
