//
//  DetailView.swift
//  BFSystemsMovieDB
//
//  Created by Guiherme de Oliveira Macedo on 24/09/23.
//

import Foundation
import UIKit

class DetailView: BaseView<DetailView.Model> {
    
    struct Constants {
        static let numberOfLines: Int = 0
        
        static let spacing: CGFloat = 0
        
        static let constraint0: CGFloat = 0
        static let constraint5: CGFloat = 5
        static let constraint10: CGFloat = 10
        static let constraint15: CGFloat = 15
        
        static let imageHeight: CGFloat = 114
        static let imageWidth: CGFloat = 80
        
        static let separatorHeight: CGFloat = 1
        
        static let secondStackViewHeight: CGFloat = 17
        
        static let labelWidth: CGFloat = 35
        
        static let posterRadius: CGFloat = 6
        
        static let fontSize14: CGFloat = 14
        static let fontSize15: CGFloat = 15
        static let fontSize17: CGFloat = 17
    }
    
    struct Model: BaseViewData {
        var movie: MovieResult
    }
    
    let scrollView = UIScrollView()
    let scrollViewContainer = UIView()
    let contentStackView = UIStackView()
    
    let imageContainerView = UIView()
    let firstImageStackView = UIStackView()
    let secondImageStackView = UIStackView()
    let thirdImageStackView = UIStackView()
    let fourthImageStackView = UIStackView()
    let fifthImageStackView = UIStackView()
    let sixthImageStackView = UIStackView()
    let seventhImageStackView = UIStackView()
    let eighthImageStackView = UIStackView()
    let ninthImageStackView = UIStackView()
    let posterHoldingView = UIView()
    let posterImageView = UIImageView()
    let movieTitleLabel = UILabel()
    let releaseDateLabel = UILabel()
    
    let overviewSeparator = UIView()
    
    let overviewContainerView = UIView()
    let overviewStackView = UIStackView()
    let overviewTitleLabel = UILabel()
    let overviewLabel = UILabel()
    
    weak var delegate: DetailViewControllerDelegate?
    
    init(model: DetailView.Model, delegate: DetailViewControllerDelegate) {
        self.delegate = delegate
        super.init(model: model, frame: .zero)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
        
        backgroundColor = .white
        
        setupScrollView()
        setupScrollViewContainer()
        setupContentStackView()
        setupFirstImageStackView()
        setupPosterHoldingView()
        setupSecondImageStackView()
        setupThirdImageStackView()
        setupFourthImageStackView()
        setupFifthImageStackView()
        setupSixthImageStackView()
        setupSeventhImageStackView()
        setupEighthImageStackView()
        setupNinthImageStackView()
        setupPosterImageView()
        setupTvShowTitleLabel()
        setupRuntimeLabel()
        setupOverviewSeparator()
        setupOverviewStackView()
        setupOverviewLabel()
        setupOverviewTextLabel()
    }
    
    override func didUpdateModel() {
        movieTitleLabel.text = model.movie.title
        
        overviewLabel.text = model.movie.overview
        
        if let posterImageURL = model.movie.posterPath {
            posterImageView.setImage(withURL: "https://image.tmdb.org/t/p/w600_and_h900_bestv2\(posterImageURL)", placeholderImage: UIImage(named: "interrogation.jpeg") ?? UIImage())
        } else {
            posterImageView.image =  UIImage(named: "interrogation.jpeg")
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: model.movie.releaseDate)
        
        dateFormatter.dateStyle = .medium

        releaseDateLabel.text = "Release date: " + dateFormatter.string(from: date ?? Date())
        
        overviewTitleLabel.text = "Overview"
    }
    
    override func addSubviews() {
        setupViewSubviews()
        setupScrollViewSubviews()
        setupScrollViewContainerSubviews()
        setupContentStackViewSubviews()
        setupImageContainerViewSubviews()
        setupFirstImageStackViewSubviews()
        setupPosterHoldingViewSubviews()
        setupSecondImageStackViewSubviews()
        setupThirdImageStackViewSubviews()
        setupFourthImageStackViewSubviews()
        setupFifthImageStackViewSubviews()
        setupSixthImageStackViewSubviews()
        setupSeventhImageStackViewSubviews()
        setupEighthImageStackViewSubviews()
        setupNinthImageStackViewSubviews()
        setupOverviewContainerViewSubviews()
        setupOverviewStackViewSubviews()
    }
    
    override func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            contentStackView.leadingAnchor.constraint(equalTo: scrollViewContainer.leadingAnchor, constant: Constants.constraint15),
            contentStackView.trailingAnchor.constraint(equalTo: scrollViewContainer.trailingAnchor, constant: -Constants.constraint15),
            contentStackView.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: Constants.constraint10),
            contentStackView.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor),
            
            firstImageStackView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            firstImageStackView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            firstImageStackView.topAnchor.constraint(equalTo: imageContainerView.topAnchor, constant: Constants.constraint5),
            firstImageStackView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor, constant: -Constants.constraint5),
            
            posterImageView.leadingAnchor.constraint(equalTo: posterHoldingView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: posterHoldingView.trailingAnchor),
            posterImageView.topAnchor.constraint(equalTo: posterHoldingView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: posterHoldingView.bottomAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: Constants.imageHeight),
            posterImageView.widthAnchor.constraint(equalToConstant: Constants.imageWidth),
            
            overviewSeparator.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            overviewStackView.leadingAnchor.constraint(equalTo: overviewContainerView.leadingAnchor),
            overviewStackView.trailingAnchor.constraint(equalTo: overviewContainerView.trailingAnchor),
            overviewStackView.topAnchor.constraint(equalTo: overviewContainerView.topAnchor, constant: Constants.constraint10),
            overviewStackView.bottomAnchor.constraint(equalTo: overviewContainerView.bottomAnchor, constant: -Constants.constraint10)
        ])
    }
}

extension DetailView: DetailViewDelegate {
    func setup(movie: MovieResult) {
        self.model.movie = movie
    }
}

extension DetailView {
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupScrollViewContainer() {
        scrollViewContainer.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupContentStackView() {
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        contentStackView.axis = .vertical
        contentStackView.distribution = .fill
        contentStackView.alignment = .fill
        contentStackView.spacing = Constants.constraint10
        contentStackView.contentMode = .scaleToFill
    }
    
    func setupFirstImageStackView() {
        firstImageStackView.translatesAutoresizingMaskIntoConstraints = false
        firstImageStackView.axis = .horizontal
        firstImageStackView.distribution = .fill
        firstImageStackView.alignment = .top
        firstImageStackView.spacing = Constants.spacing
        firstImageStackView.contentMode = .scaleToFill
    }
    
    func setupSecondImageStackView() {
        secondImageStackView.translatesAutoresizingMaskIntoConstraints = false
        secondImageStackView.axis = .vertical
        secondImageStackView.distribution = .fill
        secondImageStackView.alignment = .fill
        secondImageStackView.spacing = Constants.spacing
        secondImageStackView.contentMode = .scaleToFill
    }
    
    func setupThirdImageStackView() {
        thirdImageStackView.translatesAutoresizingMaskIntoConstraints = false
        thirdImageStackView.axis = .horizontal
        thirdImageStackView.distribution = .fill
        thirdImageStackView.alignment = .fill
        thirdImageStackView.spacing = Constants.constraint15
        thirdImageStackView.contentMode = .scaleToFill
    }
    
    func setupFourthImageStackView() {
        fourthImageStackView.translatesAutoresizingMaskIntoConstraints = false
        fourthImageStackView.axis = .vertical
        fourthImageStackView.distribution = .fill
        fourthImageStackView.alignment = .fill
        fourthImageStackView.spacing = Constants.spacing
        fourthImageStackView.contentMode = .scaleToFill
    }
    
    func setupFifthImageStackView() {
        fifthImageStackView.translatesAutoresizingMaskIntoConstraints = false
        fifthImageStackView.axis = .vertical
        fifthImageStackView.distribution = .fill
        fifthImageStackView.alignment = .fill
        fifthImageStackView.spacing = Constants.constraint5
        fifthImageStackView.contentMode = .scaleToFill
    }
    
    func setupSixthImageStackView() {
        sixthImageStackView.translatesAutoresizingMaskIntoConstraints = false
        sixthImageStackView.axis = .vertical
        sixthImageStackView.distribution = .fill
        sixthImageStackView.alignment = .fill
        sixthImageStackView.spacing = Constants.spacing
        sixthImageStackView.contentMode = .scaleToFill
    }
    
    func setupSeventhImageStackView() {
        seventhImageStackView.translatesAutoresizingMaskIntoConstraints = false
        seventhImageStackView.axis = .vertical
        seventhImageStackView.distribution = .fill
        seventhImageStackView.alignment = .fill
        seventhImageStackView.spacing = Constants.spacing
        seventhImageStackView.contentMode = .scaleToFill
    }
    
    func setupEighthImageStackView() {
        eighthImageStackView.translatesAutoresizingMaskIntoConstraints = false
        eighthImageStackView.axis = .vertical
        eighthImageStackView.distribution = .fill
        eighthImageStackView.alignment = .fill
        eighthImageStackView.spacing = Constants.spacing
        eighthImageStackView.contentMode = .scaleToFill
    }
    
    func setupNinthImageStackView() {
        ninthImageStackView.translatesAutoresizingMaskIntoConstraints = false
        ninthImageStackView.axis = .horizontal
        ninthImageStackView.distribution = .fill
        ninthImageStackView.alignment = .top
        ninthImageStackView.spacing = Constants.spacing
        ninthImageStackView.contentMode = .scaleToFill
    }
    
    func setupPosterHoldingView() {
        posterHoldingView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupPosterImageView() {
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let posterCornerRadius = CGFloat(Constants.posterRadius)
        posterImageView.layer.cornerRadius = posterCornerRadius
    }
    
    func setupTvShowTitleLabel() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.numberOfLines = Constants.numberOfLines
    }
    
    func setupRuntimeLabel() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.numberOfLines = Constants.numberOfLines
    }
    
    func setupOverviewSeparator() {
        overviewSeparator.translatesAutoresizingMaskIntoConstraints = false
        overviewSeparator.backgroundColor = .black
    }
    
    func setupOverviewContainerView() {
        overviewContainerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupOverviewStackView() {
        overviewStackView.translatesAutoresizingMaskIntoConstraints = false
        overviewStackView.axis = .vertical
        overviewStackView.distribution = .fill
        overviewStackView.alignment = .leading
        overviewStackView.spacing = Constants.constraint5
        overviewStackView.contentMode = .scaleToFill
    }
    
    func setupOverviewLabel() {
        overviewTitleLabel.numberOfLines = Constants.numberOfLines
        overviewTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupOverviewTextLabel() {
        overviewLabel.numberOfLines = Constants.numberOfLines
        overviewLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupLabels() {
        movieTitleLabel.font = UIFont.systemFont(ofSize: Constants.fontSize17, weight: .semibold)
        
        releaseDateLabel.font = UIFont.systemFont(ofSize: Constants.fontSize14, weight: .regular)
        releaseDateLabel.textColor = .darkGray
        
        overviewTitleLabel.font = UIFont.systemFont(ofSize: Constants.fontSize17, weight: .bold)
        
        overviewLabel.font = UIFont.systemFont(ofSize: Constants.fontSize15, weight: .regular)
        overviewLabel.textColor = .darkGray
    }
    
    func setupViewSubviews() {
        addSubview(scrollView)
    }
    
    func setupScrollViewSubviews() {
        scrollView.addSubview(scrollViewContainer)
    }
    
    func setupScrollViewContainerSubviews() {
        scrollViewContainer.addSubview(contentStackView)
    }
    
    func setupContentStackViewSubviews() {
        contentStackView.addArrangedSubViews([
            imageContainerView,
            overviewSeparator,
            overviewContainerView,
        ])
    }
    
    func setupImageContainerViewSubviews() {
        imageContainerView.addSubview(firstImageStackView)
    }
    
    func setupFirstImageStackViewSubviews() {
        firstImageStackView.addArrangedSubViews([
            secondImageStackView
        ])
    }
    
    func setupPosterHoldingViewSubviews() {
        posterHoldingView.addSubview(posterImageView)
    }
    
    func setupSecondImageStackViewSubviews() {
        secondImageStackView.addArrangedSubViews([
            thirdImageStackView
        ])
    }
    
    func setupThirdImageStackViewSubviews() {
        thirdImageStackView.addArrangedSubViews([
            fourthImageStackView,
            fifthImageStackView
        ])
    }
    
    func setupFourthImageStackViewSubviews() {
        fourthImageStackView.addArrangedSubViews([
            posterHoldingView
        ])
    }
    
    func setupFifthImageStackViewSubviews() {
        fifthImageStackView.addArrangedSubViews([
            sixthImageStackView,
            seventhImageStackView
        ])
    }
    
    func setupSixthImageStackViewSubviews() {
        sixthImageStackView.addArrangedSubViews([
            movieTitleLabel
        ])
    }
    
    func setupSeventhImageStackViewSubviews() {
        seventhImageStackView.addArrangedSubViews([
            eighthImageStackView
        ])
    }
    
    func setupEighthImageStackViewSubviews() {
        eighthImageStackView.addArrangedSubViews([
            ninthImageStackView
        ])
    }
    
    func setupNinthImageStackViewSubviews() {
        ninthImageStackView.addArrangedSubViews([
            releaseDateLabel
        ])
    }
    
    func setupOverviewContainerViewSubviews() {
        overviewContainerView.addSubview(overviewStackView)
    }
    
    func setupOverviewStackViewSubviews() {
        overviewStackView.addArrangedSubViews([
            overviewTitleLabel,
            overviewLabel
        ])
    }
}
