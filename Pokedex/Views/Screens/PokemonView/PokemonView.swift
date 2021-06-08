//
//  PokemonView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct PokemonView: View {
    @EnvironmentObject var modelData: DataLoader

    var filteredPokemon: [FavoritePokemon] {
        modelData.pokemon.filter { pokemon in !pokemon.isFavorite || pokemon.isFavorite }
    }
    
    var body: some View {
        List {
            ForEach(filteredPokemon) { pokemon in
                NavigationLink( destination: PokemonDetailView(pokemon: pokemon),
                    label: {
                        PokemonCell(pokemon: pokemon)
                    })
            }
        }
        .navigationTitle("Pokemon")
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
            .environmentObject(DataLoader())
    }
}
