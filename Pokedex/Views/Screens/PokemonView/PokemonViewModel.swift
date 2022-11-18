//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published var pokemon: [FavorablePokemon] = []
    @Published var favoritePokemon: [FavorablePokemon] = []

    init() {
        load()
    }
        
    private func convert(pokemon: [Pokemon]) -> [FavorablePokemon] {
        var favorites: [FavorablePokemon] = []
        for pokemon in pokemon {
            let favorablePokemon = FavorablePokemon(
                id: pokemon.id,
                name: pokemon.name,
                type: pokemon.type,
                imageUrl: pokemon.imageUrl,
                description: pokemon.description,
                isFavorite: false)
            
            favorites.append(favorablePokemon)
        }
        return favorites
    }
    
    func filterFavorites() {
        let favorites = pokemon.filter({ $0.isFavorite == true })
        favoritePokemon = favorites
    }
    
    func load() {
        if let fileLocation = Bundle.main.url(forResource: "Pokemon", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode([Pokemon].self, from: data)
                let savedPokemon = StorageManager.shared.loadPokemon(from: StorageManager.FileURL.allPokemon)
                if savedPokemon.isEmpty {
                    StorageManager.shared.save(convert(pokemon: pokemon), to: StorageManager.FileURL.allPokemon)
                }
                self.pokemon = savedPokemon
            } catch {
                print(error)
            }
        }
    }
    
}
