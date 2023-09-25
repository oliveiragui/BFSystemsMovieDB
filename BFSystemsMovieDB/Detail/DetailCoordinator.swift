//
//  DetailCoordinator.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation

public class DetailCoordinator: BaseCoordinator {
        
    
    public required init(with configuration: CoordinatorConfiguration, parentCoordinator: BaseCoordinator? = nil, delegate: BaseCoordinatorDelegate? = nil) {
        super.init(with: configuration, parentCoordinator: parentCoordinator, delegate: delegate)
    }
    
    func start(movie: MovieResult, isFavorite: Bool = false) {
        let viewModel = DetailViewModel(navigationHandler: self)
        let controller = DetailViewController(viewModel: viewModel, movie: movie)
        
        show(viewController: controller, as: .push(animated: true))
    }
}

extension DetailCoordinator: DetailViewNavigationHandler {}
