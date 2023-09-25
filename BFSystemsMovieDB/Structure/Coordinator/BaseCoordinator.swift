//
//  BaseCoordinator.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

public typealias ControllerPresentationCompletion = (() -> Void)

open class BaseCoordinator: Coordinator {

    public enum Presentation {
        case present(animated: Bool, completion: ControllerPresentationCompletion?)
        case push(animated: Bool)
        case show
    }

    var parentCoordinator: BaseCoordinator?
    var childCoordinators: [Coordinator] = []
    public var configuration: CoordinatorConfiguration

    weak var baseDelegate: BaseCoordinatorDelegate?

    public required init(with configuration: CoordinatorConfiguration, parentCoordinator: BaseCoordinator? = nil, delegate: BaseCoordinatorDelegate? = nil) {
        self.configuration = configuration
        self.parentCoordinator = parentCoordinator
        baseDelegate = delegate

        self.parentCoordinator?.insertChild(childCoordinator: self)
    }

    open func start() {
        assertionFailure("Start function must be implemented in all childs")
    }

    open func insertChild(childCoordinator: BaseCoordinator) {
        childCoordinators.append(childCoordinator)
    }

    public func show(viewController: UIViewController, as presentation: Presentation) {
        switch presentation {
        case let .present(animated, completion):
            configuration.navigationController?.present(viewController, animated: animated, completion: completion)
        case let .push(animated):
            configuration.navigationController?.pushViewController(viewController, animated: animated)
        case .show:
            configuration.navigationController?.show(viewController, sender: self)
        }
    }
}

extension BaseCoordinator: CoordinatorProtocol {

    public func removeCoordinator() {
        if let parentCoordinator = parentCoordinator, !parentCoordinator.childCoordinators.isEmpty {
            parentCoordinator.childCoordinators.removeLast()
        }
        baseDelegate?.coordinatorRemoved()
    }
}
