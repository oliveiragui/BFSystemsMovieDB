//
//  DetailViewModel.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelProtocol {
    
    weak var navigationHandler: DetailViewNavigationHandler?
    weak var viewDelegate: DetailViewModelToControllerDelegate?
    
    init(navigationHandler: DetailViewNavigationHandler) {
        self.navigationHandler = navigationHandler
    }
    
    func setupView(viewDelegate: DetailViewModelToControllerDelegate) {
        self.viewDelegate = viewDelegate
    }
}

