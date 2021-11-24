//
//  MemoryGame.swift
//  Memorize
//
//  Created by Marius Captari on 21/11/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    private(set) var cards: Array<Card>
    private(set) var score: Int
    private var IndexOfTheOneAndOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            //In case second card is revealed
            if let potentialMatchIndex = IndexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {
                    if cards[chosenIndex].wasSeen == true {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].wasSeen == true {
                        score -= 1
                    }
                }
                cards[chosenIndex].wasSeen = true
                cards[potentialMatchIndex].wasSeen = true
                IndexOfTheOneAndOnlyFaceUpCard = nil
            }
            //In case only one card was revealed
            else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                IndexOfTheOneAndOnlyFaceUpCard = chosenIndex
                //cards[chosenIndex].wasSeen = true
                
            }
            cards[chosenIndex].isFaceUp.toggle()
            print("choosenCard = \(cards[chosenIndex])")
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        score = 0
        // add number of pairs x2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var wasSeen: Bool = false
        var content: CardContent
    }
}
