//
//  PokemonView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject var pokemonVM: PokemonViewModel
    @State var searchText = ""
    @State var searchedPokemon: [FavorablePokemon] = []
    @AppStorage("firstRun") private var firstRun = true
    
    var body: some View {
        VStack {
            if pokemonVM.pokemon.isEmpty {
                ProgressView()
                    .navigationTitle(Constants.Title.pokemon)
            } else {
                List {
                    if searchText.isEmpty {
                        ForEach($pokemonVM.pokemon) { pokemon in
                            NavigationLink(
                                destination:
                                    PokemonDetailView(pokemon: pokemon)
                                , label: { PokemonCell(pokemon: pokemon) })
                        }
                    } else {
                        ForEach($searchedPokemon) { pokemon in
                            NavigationLink(
                                destination:
                                    PokemonDetailView(pokemon: pokemon, mode: .favorite)
                                , label: { PokemonCell(pokemon: pokemon) })
                        }
                    }
                }
                .searchable(text: $searchText)
                .disableAutocorrection(true)
                .listStyle(.plain)
                .navigationTitle(Constants.Title.pokemon)
                .onChange(of: searchText) { text in
                    let localPokemon = pokemonVM.pokemon
                    searchedPokemon = localPokemon.filter({ $0.name.contains(searchText.lowercased()) })
                    print(searchText)
                    print(searchedPokemon)
                }
            }
        }
        .task {
            if firstRun {
                Task {
                    firstRun = false
                    try await Task.sleep(nanoseconds: 2_000_000)
                    pokemonVM.load()
                }
            }
        }
        .onChange(of: pokemonVM.pokemon) { newValue in
            StorageManager.shared.save(pokemonVM.pokemon,
                                       to: StorageManager.FileURL.allPokemon)
            pokemonVM.filterFavorites()
        }
    }
}

struct PokemonView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView(pokemonVM: PokemonViewModel())
    }
}
