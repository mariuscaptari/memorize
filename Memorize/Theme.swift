//
//  Theme.swift
//  Memorize
//
//  Created by Marius Captari on 24/11/2021.
//

import Foundation

struct Theme {
    let name: String
    let color: String
    let numberOfPairs: Int
    let emojis: [String]
    
    init(name: String, color: String, numberOfPairs: Int, emojis: [String]) {
        self.name = name
        self.color = color
        self.numberOfPairs = numberOfPairs
        self.emojis = emojis
    }
    
    init(name: String, color: String, emojis: [String]) {
        self.init(name: name, color: color, numberOfPairs: emojis.count, emojis: emojis)
    }
    
    
    static let vehicles = Theme(name: "Vehicles", color: "pink", numberOfPairs: 8,
        emojis: ["🚲","🚂","🚁","🚜","🏎","🚑","🚓","🚒","✈️","🚀","⛵",
                 "🛸","🚌","🏍","🛺","🚠","🛵","🚗","🚚","🚇","🛻","🚝"])
    static let sports = Theme(name: "Sports", color: "yellow", numberOfPairs: 10,
        emojis: ["⚽️","🏀","🏈","⚾️","🏓","🏏","🥊","🏉","🎾",
                 "🏒","🏌️‍♂️", "🏇🏻","🏄‍♂️","🚴‍♀️","🏊‍♂️"])
    static let faces = Theme(name: "Faces", color: "blue", numberOfPairs: 10,
        emojis: ["😃","😆","😇","🥰","🤪","🥳","😢","🥸","🤯","😱","🥶",
                "🥵","🧐","😋","😉","😂"])
    static let animals = Theme(name: "Animals", color: "green", numberOfPairs: 6,
        emojis: ["🐶","🐱","🐹","🦊","🐭","🐻","🐰","🐯","🐼","🐨","🐷",
                 "🐵","🐸","🦄","🐤","🐔","🐠","🦋"])
    
    static let defaultThemes: [Theme] = [vehicles,sports,faces,animals]
}
