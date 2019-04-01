//
//  tourneyHistoryTests.swift
//  tourneyHistoryTests
//
//  Created by C4Q on 3/15/19.
//  Copyright © 2019 Iram Fattah. All rights reserved.
//

import XCTest
@testable import tourneyHistory 


class tourneyHistoryTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testGameViewModel() {
        let game = DefaultGame.init(name: "MyGame", imageData: nil, abbreviation: "GG")
        let gameViewModel = DefaultGameViewModel.init(game: game)
        XCTAssertEqual(game.name, gameViewModel.name)
        
        
        
    }
    


}
