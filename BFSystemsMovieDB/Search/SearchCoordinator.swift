//
//  SearchCoordinator.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

class SearchCoordinator: BaseCoordinator {
    
    public required init(with configuration: CoordinatorConfiguration, parentCoordinator: BaseCoordinator? = nil, delegate: BaseCoordinatorDelegate? = nil) {
        super.init(with: configuration, parentCoordinator: parentCoordinator, delegate: delegate)
    }
    
    public func start(navigationController: UINavigationController?) {
        let manager = SearchManager()
        
        let viewModel = SearchViewModel(manager: manager, navigationHandler: self)

        let vc = SearchViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension SearchCoordinator: SearchViewNavigationHandler {
    func openMovieDetail(movie: MovieResult) {
        let coordinator = DetailCoordinator(with: configuration, parentCoordinator: self)
        coordinator.start(movie: movie)
    }
}
