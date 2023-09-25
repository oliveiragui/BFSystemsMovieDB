//
//  DetailViewController.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import UIKit

class DetailViewController: UIViewController {

    private lazy var detailView: DetailView = {
        let view = DetailView(model: DetailView.Model(movie: MovieResult(id: 0, overview: "", releaseDate: "", title: "")), delegate: self)
        return view
    }()
    
    var viewModel: DetailViewModelProtocol?
    weak var viewDelegate: DetailViewDelegate?

    init(viewModel: DetailViewModelProtocol, movie: MovieResult) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewDelegate = detailView
        self.viewModel?.setupView(viewDelegate: self)
        self.detailView.model.movie = movie
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(detailView)
        
        NSLayoutConstraint.activate([
            detailView.leftAnchor.constraint(equalTo: view.leftAnchor),
            detailView.rightAnchor.constraint(equalTo: view.rightAnchor),
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Detail"
    }
}

extension DetailViewController: DetailViewControllerDelegate {}

extension DetailViewController: DetailViewModelToControllerDelegate {
    func setup(movie: MovieResult) {
        viewDelegate?.setup(movie: movie)
    }
}

