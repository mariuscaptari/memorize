//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Marius Captari on 21/11/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>
    private(set) var theme: Theme
    private(set) var color: Color
    
    init() {
        // theme = Theme.defaultThemes.randomElement() ?? .animals
        theme = Theme.animals
        color = Self.selectColor(theme.color) ?? .accentColor
        model = Self.createMemoryGame(theme: theme)
    }

    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        let numberOfPairsOfCards = min(emojis.count, theme.numberOfPairs)
        return MemoryGame<String>(numberOfPairsOfCards: numberOfPairsOfCards) { pairIndex in
            emojis[pairIndex]
        }
    }

    private static func selectColor(_ color: String) -> Color? {
        switch color {
            case "red":
                return .red
            case "green":
                return  .green
            case "blue":
                return  .blue
            case "yellow":
                return  .yellow
            case "orange":
                return  .orange
            case "pink":
                return  .pink
            case "black":
                return  .black
            case "gray":
                return  .gray
            default:
                return nil
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    var score: Int {
        return model.score
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newGame() {
        let oldTheme = theme
        while theme.name == oldTheme.name {
            theme = Theme.defaultThemes.randomElement()!
        }
        color = Self.selectColor(theme.color) ?? .accentColor
        model = Self.createMemoryGame(theme: theme)
    }
}

