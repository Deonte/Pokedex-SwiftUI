//
//  PokemonView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject var pokemonVM: PokemonViewModel
    @ObservedObject var favoritesVM: FavoritesViewModel
    
    var body: some View {
        List {
            ForEach($pokemonVM.pokemon) { pokemon in
                NavigationLink(
                    destination:
                        PokemonDetailView(pokemon: pokemon,
                                          favoritesVM: favoritesVM)
                    , label: { PokemonCell(pokemon: pokemon, favoritesVM: favoritesVM) })
                
            }
        }
        .listStyle(.plain)
        .navigationTitle(Constants.Title.pokemon)
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemonVM: PokemonViewModel(), favoritesVM: FavoritesViewModel())
    }
}
