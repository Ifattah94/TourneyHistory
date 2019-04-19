//
//  Databasemanager+DefaultGames.swift
//  tourneyHistory
//
//  Created by C4Q on 4/4/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

extension DatabaseManager {
    static func addDefaultGames(defaultGameVM: [DefaultGameViewModel], userSession: UserSession) {
        guard let currentUser = userSession.getCurrentUser() else {
            print("Could not get current user")
            return
        }
        let id = currentUser.uid
        defaultGameVM.forEach { (vm) in
            firebaseDB.collection(DatabaseKeys.UsersCollectionKey).document(id).collection(DatabaseKeys.defaultGameCollectionKey).addDocument(data: ["Game Title": vm.name,
                                    "Abbreviation": vm.subtitle
                                                        ])
        }
    }
}
