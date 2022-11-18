//
//  FavoritesView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: PokemonViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.pokemon.filter({$0.isFavorite == true}).isEmpty {
                EmptyStateView()
                    .navigationTitle(Constants.Title.favorites)
            }  else {
                List {
                    ForEach($viewModel.favoritePokemon) { favorite in
                        NavigationLink(
                            destination:
                                PokemonDetailView(pokemon: favorite, mode: .favorite)
                            , label: { PokemonCell(pokemon: favorite) })
//                        PokemonCell(pokemon: favorite)
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Constants.Title.favorites)
            }
        }
        .onAppear {
            viewModel.filterFavorites()
        }
        .onChange(of: viewModel.pokemon) { newValue in
            StorageManager.shared.save(viewModel.pokemon,
                                       to: StorageManager.FileURL.allPokemon)
            print("changes")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: PokemonViewModel())
    }
}
