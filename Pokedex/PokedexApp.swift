//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

@main
struct PokedexApp: App {
    @StateObject private var modelData = DataLoader()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(modelData)
        }
    }
}
