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
    var flipCount = 0
    var score = 0
    init(numberOfCardPairs : Int) {
        for i in 0..<numberOfCardPairs
        {
            let card = Card(identifier : i)
            cards += [card, card]
        }
        //TODO: randomize cards
        shuffle()
    }
    mutating func shuffle(){
        for i in 0..<cards.count-1{
            let swapIndex = i+Int(arc4random_uniform(UInt32(cards.count-i)))
            let temp = cards[i]
            cards[i] = cards[swapIndex]
            cards[swapIndex] = temp
        }
    }
    mutating func flipCard(cardIndex : Int){
        if !cards[cardIndex].isMatched
        {
            flipCount+=1
            if let matchIndex = indexOfOnlyFlippedCard, matchIndex != cardIndex{
                if cards[matchIndex].identifier == cards[cardIndex].identifier{
                    cards[matchIndex].isMatched = true
                    cards[cardIndex].isMatched = true
                    score += 2
                }
                else{
                    if(cards[matchIndex].flippedBefore){
                        score-=1
                    }
                    if(cards[cardIndex].flippedBefore){
                        score-=1
                    }
                }
                cards[cardIndex].isFaceUp = true
                indexOfOnlyFlippedCard = nil
             }
            else{
                for flipDownIndex in cards.indices{
                    if(cards[flipDownIndex].isFaceUp)
                    {
                        cards[flipDownIndex].flippedBefore = true
                    }
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[cardIndex].isFaceUp = true
                indexOfOnlyFlippedCard = cardIndex
            }
        }
    }
}
