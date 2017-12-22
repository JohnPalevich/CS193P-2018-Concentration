//
//  Concentration.swift
//  Concentration
//
//  Created by John Palevich on 12/21/17.
//  Copyright © 2017 John Palevich. All rights reserved.
//

import Foundation

struct Concentration{
    var cards = [Card]()
    var indexOfOnlyFlippedCard : Int?
    init(numberOfCardPairs : Int) {
        for i in 0..<numberOfCardPairs
        {
            let card = Card(identifier : i)
            cards += [card, card]
        }
        //TODO: randomize cards
    }
    mutating func flipCard(cardIndex : Int){
        if !cards[cardIndex].isMatched
        {
            if let matchIndex = indexOfOnlyFlippedCard, matchIndex != cardIndex{
                if cards[matchIndex].identifier == cards[cardIndex].identifier{
                    cards[matchIndex].isMatched = true
                    cards[cardIndex].isMatched = true
                }
                cards[cardIndex].isFaceUp = true
                indexOfOnlyFlippedCard = nil
             }
            else{
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[cardIndex].isFaceUp = true
                indexOfOnlyFlippedCard = cardIndex
            }
        }
    }
}
