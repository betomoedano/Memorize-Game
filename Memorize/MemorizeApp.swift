//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Alberto Moedano on 10/26/21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
