//
//  MenuOption.swift
//  tourneyHistory
//
//  Created by C4Q on 4/5/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//
import UIKit
enum MenuOption: Int, CustomStringConvertible {
    case Profile
    case YourTournaments
    case SignOut
    
    var description: String {
        switch self {
        case .Profile: return "Profile"
        case.YourTournaments: return "Your Tournaments"
        case.SignOut: return "Sign Out"
        
        }
    }
    
    var image: UIImage {
        switch self {
        case .Profile: return UIImage(named: "ic_person_outline_white_2x") ?? UIImage()
        case.YourTournaments: return UIImage(named: "ic_mail_outline_white_2x") ?? UIImage()
        case.SignOut: return UIImage(named: "baseline_clear_white_36pt_3x") ?? UIImage()
            
        }
    }
    
}
