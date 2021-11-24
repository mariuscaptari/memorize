//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Marius Captari on 17/11/2021.
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

struct MemorizeApp_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
