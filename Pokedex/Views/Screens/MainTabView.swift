//
//  MainTabView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationView {
                PokemonView()
            }
            .tabItem {
                Text("Pokemon")
                Image(TabImage.pokemon)
                    .renderingMode(.template)
            }
            
            FavoritesView()
                .tabItem {
                    Text("Favorites")
                    Image(systemName: "star.fill")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
