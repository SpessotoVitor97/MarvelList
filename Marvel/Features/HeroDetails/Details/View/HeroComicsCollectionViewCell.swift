//
//  HeroComicsCollectionViewCell.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import UIKit

class HeroComicsCollectionViewCell: UICollectionViewCell {
    
    private lazy var comicImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    private lazy var comicName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = contentView.backgroundColor == .darkText ? .white : .black
        label.textAlignment = .left
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    override func prepareForReuse() {
        comicImage.image = nil
        comicName.text = nil
    }
    
    func configure(for hero: HeroComicsViewModel) {
        comicImage.downloadImage(withURL: hero.comicImage!)
        comicName.text = hero.comicTitle
    }
    
    private func configureViews() {
        contentView.addSubview(comicImage)
        contentView.addSubview(comicName)
        
        NSLayoutConstraint.activate([
            comicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            comicImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            comicImage.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            comicImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            comicName.leadingAnchor.constraint(equalTo: comicImage.trailingAnchor, constant: 16),
            comicName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            comicName.topAnchor.constraint(equalTo: contentView.topAnchor),
            comicName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
