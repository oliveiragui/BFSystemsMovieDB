//
//  SearchView.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SearchView: BaseView<SearchView.Model>, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    struct Constants {
        static let numberOfLines: Int = 0
        
        static let spacing: CGFloat = 10
        
        static let rowHeight: CGFloat = 150

        static let constraint0: CGFloat = 0
        
        static let searchPlaceholderText = "Search for a movie"
        
        static let welcomeText = "Search your favorite films using the search bar"
        
        static let searchingText = "Searching..."
    }
    
    struct Model: BaseViewData {
        var movies: MoviesListModel
    }
    
    var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = Constants.spacing
        view.contentMode = .scaleToFill
        
        return view
    }()
    
    var searchView: UISearchBar {
        let view = UISearchBar()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.placeholder = Constants.searchPlaceholderText
        view.returnKeyType = .search
        view.delegate = self
        
        return view
    }
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.isHidden = true

        return table
    }()
    
    private let welcomeLabel: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = Constants.welcomeText
        view.textAlignment = .center
        view.textColor = .lightGray

        return view
    }()
    
    var activityIndicator = UIActivityIndicatorView(style: .medium)
    
    weak var delegate: SearchViewControllerDelegate?
    
    init(model: SearchView.Model, delegate: SearchViewControllerDelegate) {
        self.delegate = delegate
        super.init(model: model, frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        
        backgroundColor = .white
        
        activityIndicator.hidesWhenStopped = true


        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = Constants.rowHeight
        tableView.backgroundColor = .white

        tableView.reloadData()
        
    }
    
    override func didUpdateModel() {
        tableView.reloadData()
    }
    
    override func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(searchView)
        stackView.addArrangedSubview(welcomeLabel)
        stackView.addArrangedSubview(tableView)
    }
    
    override func addConstraints() {
        let margins = safeAreaLayoutGuide
        
        stackView.anchor(top: margins.topAnchor, bottom: margins.bottomAnchor, paddingTop: Constants.constraint0, paddingBottom: Constants.constraint0)
        stackView.anchor(left: margins.leftAnchor, right: margins.rightAnchor, paddingLeft: Constants.constraint0, paddingRight: Constants.constraint0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.movies.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let movie = model.movies.results[indexPath.row]
        
        cell.textLabel?.text = movie.title
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: movie.releaseDate)
        
        dateFormatter.dateStyle = .medium
        
        cell.detailTextLabel?.text = "Release date: " + dateFormatter.string(from: date ?? Date())
        
        if let posterImageURL = movie.posterPath {
            cell.imageView?.setImage(withURL: "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(posterImageURL)", placeholderImage: UIImage(named: "interrogation.jpeg") ?? UIImage())
            
        } else {
            cell.imageView?.image =  UIImage(named: "interrogation.jpeg")
        }
        
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = model.movies.results[indexPath.row]
        delegate?.openMovieDetail(movie: movie)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.delegate?.queryMovies(query: searchBar.text ?? "", page: 1) // TODO: pra botao dps
    }
    
    func fetchSavedMovies() {
        self.delegate?.fetchSavedMovies(page: 1)
    }
}

extension SearchView: SearchViewDelegate {
    func startLoading() {
        welcomeLabel.text = Constants.searchingText
        
        welcomeLabel.isHidden = false
        tableView.isHidden = true
    }
    
    func stopLoading() {
        welcomeLabel.text = Constants.welcomeText
    }
    
    func setup(movies: MoviesListModel) {
        self.model.movies = movies
        
        welcomeLabel.isHidden = true
        tableView.isHidden = false
    }
}
