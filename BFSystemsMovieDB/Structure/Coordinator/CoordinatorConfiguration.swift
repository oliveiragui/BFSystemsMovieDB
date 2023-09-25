//
//  CoordinatorConfiguration.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

open class CoordinatorConfiguration {

    public weak var window: UIWindow?

    public weak var navigationController: UINavigationController?

    public weak var viewController: UIViewController?

    public weak var view: UIView?
    
    public init(window: UIWindow? = nil,
                viewController: UIViewController? = nil,
                navigationController: UINavigationController? = nil,
                view: UIView? = nil) {
        self.window = window
        self.viewController = viewController
        self.navigationController = navigationController
        self.view = view
    }
}

