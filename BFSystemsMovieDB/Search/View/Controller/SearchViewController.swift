//
//  SearchViewController.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import UIKit

class SearchViewController: UIViewController {

    private lazy var searchView: SearchView = {
        let view = SearchView(model: SearchView.Model(movies: MoviesListModel(page: 0, results: [], totalPages: 0)), delegate: self)
        return view
    }()
    
    var viewModel: SearchViewModelProtocol?
    weak var viewDelegate: SearchViewDelegate?

    init(viewModel: SearchViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewDelegate = searchView
        self.viewModel?.setupView(viewDelegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .blue
        
        searchView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(searchView)
        
        NSLayoutConstraint.activate([
            searchView.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.rightAnchor),
            searchView.topAnchor.constraint(equalTo: view.topAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Search"
        fetchSavedMovies(page: 1)
    }
}

extension SearchViewController: SearchViewControllerDelegate {
    func fetchSavedMovies(page: Int) {
        viewModel?.fetchSavedMovies(page: page)
    }
    
    func queryMovies(query: String, page: Int) {
        viewModel?.queryMovies(query: query, page: page)
    }
    
    func openMovieDetail(movie: MovieResult) {
        viewModel?.openMovieDetail(movie: movie)
    }
}

extension SearchViewController: SearchViewModelToControllerDelegate {
    func startLoading() {
        viewDelegate?.startLoading()
    }
    
    func stopLoading() {
        viewDelegate?.stopLoading()
    }
    
    func setup(movies: MoviesListModel) {
        viewDelegate?.setup(movies: movies)
    }
}
