//
//  DefaultGameManager.swift
//  tourneyHistory
//
//  Created by C4Q on 3/30/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import UIKit
final class DefaultGameManager {
    private init() {}
    static let shared = DefaultGameManager()
    
     func fetchDefaultGames(completion: @escaping (Error?, [DefaultGame]) -> Void) {
        let dbfzImageData = #imageLiteral(resourceName: "dbfz").jpegData(compressionQuality: 0.5)
        let dbfz = DefaultGame.init(name: "Dragonball Fighterz", imageData: dbfzImageData, abbreviation: "DBFZ")
        let meleeImageData = #imageLiteral(resourceName: "melee").jpegData(compressionQuality: 0.5)
        let melee = DefaultGame.init(name: "Super Smash Bros Melee", imageData: meleeImageData, abbreviation: "SSBM")
        let sf5ImageData = #imageLiteral(resourceName: "sfv").jpegData(compressionQuality: 0.5)
        let sf5 = DefaultGame.init(name: "Street Fighter 5", imageData: sf5ImageData, abbreviation: "SFV")
        let games = [dbfz,melee,sf5]
        
        completion(nil, games)
      

    }
    
    

}
