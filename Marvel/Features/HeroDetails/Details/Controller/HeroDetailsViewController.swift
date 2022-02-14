//
//  HeroDetailsViewController.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import UIKit

class HeroDetailsViewController: UIViewController {
    
    //*************************************************
    // MARK: - Properties
    //*************************************************
    lazy var heroImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    lazy var heroName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = view.backgroundColor == .darkText ? .white : .black
        label.textAlignment = .left
        return label
    }()
    
    lazy var heroDescription: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isSelectable = false
        textView.textAlignment = .justified
        textView.textColor = view.backgroundColor == .darkText ? .white : .black
        textView.backgroundColor = .systemBackground
        textView.font = .systemFont(ofSize: 19, weight: .light)
        return textView
    }()
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.hidesWhenStopped = true
        activity.startAnimating()
        return activity
    }()
    
    lazy var heroComics: UICollectionView = {
        let collection = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewLayout())
        collection.contentMode = .scaleToFill
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundView = activity
        collection.register(HeroComicsCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: HeroComicsCollectionViewCell.self))
        return collection
    }()
    
    lazy var heroComicsContainerView: UIView = {
        let container = UIView()
        return container
    }()
    
    var viewModel: HeroDetailsViewModel

    //*************************************************
    // MARK: - Initializers
    //*************************************************
    init(viewModel: HeroDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //*************************************************
    // MARK: - Lifecycle
    //*************************************************
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = viewModel.hero.name
        
        configure()
    }
    
    func configure() {
        addSubviews()
        configureHeroInformation()
        configureComicsCollection()
    }
    
    func configureComicsCollection() {
        heroComics.delegate = self
        heroComics.dataSource = self
    }
    
    func configureHeroInformation() {
        let hero = viewModel.hero
        heroImage.downloadImage(withURL: hero.thumbnail.fullPath)
        heroName.text = hero.name
        heroDescription.text = hero.description
    }
    
    func addSubviews() {
        self.view.addSubview(heroImage)
        self.view.addSubview(heroName)
        self.view.addSubview(heroDescription)
        self.view.addSubview(heroComics)
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            heroImage.topAnchor.constraint(equalTo: guide.topAnchor),
            heroImage.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            heroImage.heightAnchor.constraint(equalToConstant: 331),
            heroImage.widthAnchor.constraint(equalTo: guide.widthAnchor),
            
            heroName.topAnchor.constraint(equalTo: heroImage.bottomAnchor,constant: 8),
            heroName.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 8),
            heroName.heightAnchor.constraint(equalToConstant: 21),
            heroName.widthAnchor.constraint(equalTo: guide.widthAnchor),
            
            heroDescription.topAnchor.constraint(equalTo: heroName.bottomAnchor, constant: 8),
            heroDescription.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            heroDescription.heightAnchor.constraint(equalToConstant: 91),
            heroDescription.widthAnchor.constraint(equalTo: guide.widthAnchor),
            
            heroComics.topAnchor.constraint(equalTo: heroDescription.bottomAnchor, constant: 8),
            heroComics.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            heroComics.heightAnchor.constraint(equalToConstant: 363),
            heroComics.widthAnchor.constraint(equalTo: guide.widthAnchor)
        ])
    }
}

extension HeroDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getTotalComics()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: HeroComicsCollectionViewCell.self), for: indexPath) as! HeroComicsCollectionViewCell
        let heroComics = viewModel.hero.comics.items[indexPath.item]
        let heroComicsViewModel = HeroComicsViewModel(comicTitle: heroComics.name, comicImage: heroComics.resourceURI)
        cell.configure(for: heroComicsViewModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User selected \(indexPath.row)")
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension HeroDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width - 16)/2.3 - 4, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
