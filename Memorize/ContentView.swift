//
//  ContentView.swift
//  Memorize
//
//  Created by Alberto Moedano on 10/26/21.
//
// VIEW 

import SwiftUI

struct ContentView: View {
    
    let viewModel: EmojiMemoryGame
    
    @State var emojiCount = 26
    
    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(1/1, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.vertical)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle).foregroundColor(.orange)
            } else {
                if #available(iOS 15.0, *) {
                    shape.fill().foregroundColor(.mint)
                    shape.strokeBorder(lineWidth: 3).foregroundColor(.orange)
                } else {
                    shape.fill().foregroundColor(.yellow)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        if #available(iOS 15.0, *) {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        } else {
            // Fallback on earlier versions
        }
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
