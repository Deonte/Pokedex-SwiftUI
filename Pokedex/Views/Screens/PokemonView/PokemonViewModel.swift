//
//  PokemonViewModel.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation

final class PokemonViewModel: ObservableObject {
    @Published var pokemon: [FavorablePokemon] = []
    
    init() { load() }
    
    private func convertPokemonToFavType(pokemon: [Pokemon]) -> [FavorablePokemon] {
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
    
    private func load() {
        if let fileLocation = Bundle.main.url(forResource: "Pokemon", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let decoder = JSONDecoder()
                let pokemon = try decoder.decode([Pokemon].self, from: data)
                self.pokemon = convertPokemonToFavType(pokemon: pokemon)
            } catch {
                print(error)
            }
        }
    }
    
}
