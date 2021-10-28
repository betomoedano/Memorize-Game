//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alberto Moedano on 10/27/21.
//
// View Model

import SwiftUI


class EmojiMemoryGame {
    static let emojis: [String] = ["🤡", "👺", "😷", "👾", "🤦🏻‍♂️", "🐒", "🐶","👑", "👛", "🌂", "🌸", "🌏", "🌛", "🌜", "🧀", "🥝", "🥕","🍎", "🚣🏻‍♂️", "🏅", "🎸", "🎨", "🚒", "❤️", "🎁", "🛒"]
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4){
            pairIndex in
                    emojis[pairIndex]
        }
    }
    
    private(set) var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - INTENT(S)

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

