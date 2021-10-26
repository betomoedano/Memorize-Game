//
//  ContentView.swift
//  Memorize
//
//  Created by Alberto Moedano on 10/26/21.
//

import SwiftUI

struct ContentView: View {
    
    var emojis: [String] = ["🤡", "👺", "😷", "👾", "🤦🏻‍♂️", "🐒", "🐶",
        "👑", "👛", "🌂", "🌸", "🌏", "🌛", "🌜", "🧀", "🥝", "🥕",
        "🍎", "🚣🏻‍♂️", "🏅", "🎸", "🎨", "🚒", "❤️", "🎁", "🛒"]
    @State var emojiCount = 26
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(1/1, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.gray)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
        }
        .padding(.vertical)
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")        })
    }
}


struct CardView: View {
    
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle).foregroundColor(.orange)
            } else {
                if #available(iOS 15.0, *) {
                    shape.fill().foregroundColor(.mint)
                    shape.strokeBorder(lineWidth: 3).foregroundColor(.orange)
                } else {
                    shape.fill().foregroundColor(.yellow)
                }
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
