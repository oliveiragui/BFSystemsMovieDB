//
//  BaseView.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

public protocol CustomViewProtocol: UIView, UpdatableModel, ViewCode { }

open class BaseView<M: BaseViewData>: UIView, CustomViewProtocol {

    public var model: M {
        didSet {
            didUpdateModel()
        }
    }
    
    public init(model: M, frame: CGRect = .zero) {
        self.model = model
        super.init(frame: frame)
        configure()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        loadView()
        didUpdateModel()
    }
    
    open func didUpdateModel() {
        /* Intentionally unimplemented */
    }
    
    open func createSubViews() {
        /* Intentionally unimplemented */
    }
    
    open func addSubviews() {
        clipsToBounds = true
    }
    
    open func addConstraints() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
