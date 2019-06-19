//
//  HomeView.swift
//  tourneyHistory
//
//  Created by C4Q on 4/9/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class HomeView: UIView {

    public var cellID = "tourneyCollectionCell"
    lazy var tourneyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: self.bounds, collectionViewLayout: layout)
        cv.register(TourneyCell.self, forCellWithReuseIdentifier: cellID)
        cv.backgroundColor = .white
        return cv
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
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
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(tourneyCollectionView)
        tourneyCollectionView.translatesAutoresizingMaskIntoConstraints = false
        tourneyCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tourneyCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tourneyCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tourneyCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true 
        
    }
    

}
