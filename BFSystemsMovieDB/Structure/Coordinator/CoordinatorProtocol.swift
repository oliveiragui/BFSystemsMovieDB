//
//  CoordinatorProtocol.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation

public protocol BaseCoordinatorDelegate: AnyObject {
    func coordinatorRemoved()
}

protocol CoordinatedProtocol: AnyObject {

    var coordinatorDelegate: CoordinatorProtocol? { get set }

    func setCoordinatorDelegate(_ coordinatorDelegate: CoordinatorProtocol?)
}

public protocol CoordinatorProtocol: AnyObject {
    func removeCoordinator()
}

protocol Coordinator {

    var parentCoordinator: BaseCoordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var configuration: CoordinatorConfiguration { get set }

    init(with configuration: CoordinatorConfiguration,
         parentCoordinator: BaseCoordinator?,
         delegate: BaseCoordinatorDelegate?)

    func start()
}
