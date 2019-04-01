//
//  DefaultGameCell.swift
//  tourneyHistory
//
//  Created by C4Q on 3/21/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit

class DefaultGameCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var gameViewModel: DefaultGameViewModel! {
        didSet {
            nameLabel.text = gameViewModel.name
            imageView.image = UIImage.init(data: gameViewModel.imageData!)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.layer.borderWidth = 3.0
            self.layer.borderColor = isSelected ? UIColor.black.cgColor : UIColor.clear.cgColor
        }
    }

}
