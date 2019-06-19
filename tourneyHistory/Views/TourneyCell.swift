//
//  TourneyCell.swift
//  tourneyHistory
//
//  Created by C4Q on 4/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class TourneyCell: UICollectionViewCell {
    lazy var tourneyImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .green
        iv.image = #imageLiteral(resourceName: "placeholder-image")
        return iv
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .blue
        label.text = "4/20 - 4/22"
        return label
        
    }()
    
    lazy var locationlabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .purple
        label.text = "NY"
        return label
    }()
    
    lazy var gamesLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray 
        label.text = "Melee SIngles, Dragonball Fighterz, Street Fighter V"
        return label
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        
    }
    
    private func setupViews() {
        setupImageView()
        setupDateLabel()
        setupLocationLabel()
        setupGamesLabel()
    }
    
    private func setupImageView() {
        self.addSubview(tourneyImageView)
        tourneyImageView.translatesAutoresizingMaskIntoConstraints = false
        tourneyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        tourneyImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        tourneyImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        tourneyImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.48).isActive = true
    }
    
    

    
    private func setupDateLabel() {
        self.addSubview(dateLabel)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        dateLabel.topAnchor.constraint(equalTo: tourneyImageView.bottomAnchor, constant: 4).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.08).isActive = true
        
    }
    private func setupLocationLabel() {
        self.addSubview(locationlabel)
        locationlabel.translatesAutoresizingMaskIntoConstraints = false
        locationlabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        locationlabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.3).isActive = true
        locationlabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4).isActive = true
        locationlabel.heightAnchor.constraint(equalToConstant: self.frame.height * 0.08).isActive = true
        
        
    }
    
    private func setupGamesLabel() {
        self.addSubview(gamesLabel)
        gamesLabel.translatesAutoresizingMaskIntoConstraints = false
        gamesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        gamesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        gamesLabel.topAnchor.constraint(equalTo: locationlabel.bottomAnchor, constant: 4).isActive = true
        gamesLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    
    
    
}
