//
//  Card.swift
//  Concentration
//
//  Created by John Palevich on 12/21/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation

struct Card {
    var identifier : Int
    var isFaceUp = false
    var isMatched = false
    var flippedBefore = false
    init(identifier : Int) {
        self.identifier = identifier
    }
}
