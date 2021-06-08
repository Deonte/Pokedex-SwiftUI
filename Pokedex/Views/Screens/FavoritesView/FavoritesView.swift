//
//  FavoritesView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var modelData: DataLoader
    @State private var showFavoritesOnly = true
    @State var favorites: [FavoritePokemon] = []

    var filteredPokemon: [FavoritePokemon] {
        modelData.pokemon.filter { pokemon in !showFavoritesOnly || pokemon.isFavorite }
    }
    
    var body: some View {
        NavigationView {
            if filteredPokemon.isEmpty {
                EmptyStateView()
                    .navigationTitle("Favorites ♥️")
            }  else {
                List {
                    ForEach(filteredPokemon) { favorite in
                        NavigationLink( destination: PokemonDetailView(pokemon: favorite),
                            label: {
                                PokemonCell(pokemon: favorite)
                            })
                    }
                }
                .navigationTitle("Favorites ♥️")
            }
        }
    }
    
   
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(DataLoader())
    }
}
