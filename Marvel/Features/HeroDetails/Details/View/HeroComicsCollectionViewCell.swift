//
//  HeroComicsCollectionViewCell.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import UIKit

class HeroComicsCollectionViewCell: UICollectionViewCell {
    
    lazy var comicImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleToFill
        return imgView
    }()
    
    lazy var comicName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = contentView.backgroundColor == .darkText ? .white : .black
        label.textAlignment = .left
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure() {
        
    }
}
