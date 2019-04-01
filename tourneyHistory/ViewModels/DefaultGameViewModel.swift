//
//  DefaultGameViewModel.swift
//  tourneyHistory
//
//  Created by C4Q on 3/22/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//


import UIKit
struct DefaultGameViewModel {
 
    var name: String
    var subtitle: String
    var imageData: Data?
    init(game: DefaultGame) {
        self.name = game.name
        self.subtitle = game.abbreviation
        self.imageData = game.imageData
        
    }

}
    

