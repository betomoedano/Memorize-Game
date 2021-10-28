//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alberto Moedano on 10/27/21.
//
// MODEL

import Foundation


struct MemoryGame<CardContent> {
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    private(set) var cards: Array<Card>
    
    
    //initializer
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    func choose (_ card: Card) {
        print("hello")
    }
}
