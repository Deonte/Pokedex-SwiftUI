//
//  FavoritesView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel: FavoritesViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.favoritePokemon.isEmpty {
                EmptyStateView()
                    .navigationTitle(Constants.Title.favorites)
            }  else {
                List {
                    ForEach($viewModel.favoritePokemon) { favorite in
                        NavigationLink(destination: PokemonDetailView(pokemon: favorite, favoritesVM: viewModel),
                            label: {
                            PokemonCell(pokemon: favorite, favoritesVM: viewModel)
                            })
                    }
                }
                .listStyle(.plain)
                .navigationTitle(Constants.Title.favorites)
            }
        }
    }
   
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(viewModel: FavoritesViewModel())
            .environmentObject(PokemonViewModel())
    }
}
