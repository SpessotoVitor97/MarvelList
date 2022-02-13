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
    
    func configure(for hero: HeroComicsModel) {
        
    }
    
    private func configureViews() {
        contentView.addSubview(comicImage)
        contentView.addSubview(comicName)
        
        comicImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        comicImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        comicImage.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        comicImage.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        comicName.leadingAnchor.constraint(equalTo: comicImage.trailingAnchor, constant: 16).isActive = true
        comicName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        comicName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        comicName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
