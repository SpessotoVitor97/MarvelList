//
//  HerosCell.swift
//  Marvel
//
//  Created by Vitor Spessoto on 12/02/22.
//

import UIKit

class HerosCell: UITableViewCell {
    lazy var heroImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    lazy var heroName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configureViews()
    }
    
    func configureViews() {
        contentView.addSubview(heroImage)
        contentView.addSubview(heroName)
        
        heroImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        heroImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        heroImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        heroImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        heroName.leadingAnchor.constraint(equalTo: heroImage.trailingAnchor, constant: 16).isActive = true
        heroName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        heroName.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        heroName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
