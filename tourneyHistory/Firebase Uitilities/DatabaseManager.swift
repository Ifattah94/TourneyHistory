//
//  DatabaseManager.swift
//  tourneyHistory
//
//  Created by C4Q on 3/19/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

final class DatabaseManager {
    
    private init() {}
    
    static let firebaseDB: Firestore = {
        // gets a reference to firestore database
        let db = Firestore.firestore()
        let settings = db.settings
        db.settings = settings
        
        return db
    }()
}
