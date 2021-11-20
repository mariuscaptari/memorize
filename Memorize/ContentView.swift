//
//  ContentView.swift
//  Memorize
//
//  Created by Marius Captari on 17/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["vehicles": ["✈️","⛴","🚂","🚜","🚅","🚀","🚗","🚙","⛵️","🚑","🚌","🚔","🚢","🚁","🚲","🏎","🏍","🚞","🚟","🛶"]
                  ,"animals": ["🐶","🐱","🐹","🦊","🐭","🐻","🐰","🐯","🐼","🐨","🐷","🐵","🐸","🦄","🐤","🐔","🐠","🦋"]
        ]
    @State var selectedTheme = "vehicles"
    @State var emojiCount = 6
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.title)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[selectedTheme]![0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.orange)
            Spacer()
            HStack {
                remove
                Spacer()
                vehicles
                animals
                Spacer()
                add
                
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis[selectedTheme]!.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    var vehicles: some View {
        Button {
            if emojiCount > emojis["vehicles"]!.count {
                emojiCount = emojis["vehicles"]!.count
            }
            selectedTheme = "vehicles"
            emojis[selectedTheme] = emojis[selectedTheme]!.shuffled()
        } label: {
            VStack {
                Image(systemName: "car")
                Text("Vehicles")
                    .font(.footnote)
            }
        }
    }
    var animals: some View {
        Button {
            if emojiCount > emojis["animals"]!.count {
                emojiCount = emojis["animals"]!.count
            }
            selectedTheme = "animals"
            emojis[selectedTheme] = emojis[selectedTheme]!.shuffled()
        } label: {
            VStack {
                Image(systemName: "tortoise")
                Text("Animals")
                    .font(.footnote)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}

