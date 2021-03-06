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
        emojis: ["π²","π","π","π","π","π","π","π","βοΈ","π","β΅",
                 "πΈ","π","π","πΊ","π ","π΅","π","π","π","π»","π"])
    static let sports = Theme(name: "Sports", color: "yellow", numberOfPairs: 10,
        emojis: ["β½οΈ","π","π","βΎοΈ","π","π","π₯","π","πΎ",
                 "π","ποΈββοΈ", "ππ»","πββοΈ","π΄ββοΈ","πββοΈ"])
    static let faces = Theme(name: "Faces", color: "blue", numberOfPairs: 10,
        emojis: ["π","π","π","π₯°","π€ͺ","π₯³","π’","π₯Έ","π€―","π±","π₯Ά",
                "π₯΅","π§","π","π","π"])
    static let animals = Theme(name: "Animals", color: "green", numberOfPairs: 6,
        emojis: ["πΆ","π±","πΉ","π¦","π­","π»","π°","π―","πΌ","π¨","π·",
                 "π΅","πΈ","π¦","π€","π","π ","π¦"])
    
    static let defaultThemes: [Theme] = [vehicles,sports,faces,animals]
}
