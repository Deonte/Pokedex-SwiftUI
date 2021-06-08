//
//  JSONDataLoader.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation
import Combine

final class DataLoader: ObservableObject {
    @Published var pokemon = [FavoritePokemon]()
    
    init() {
        load()
        sort()
    }
    
    
    func getPokemon() {
        DispatchQueue.main.async {
            let dataLoader = DataLoader()
            self.pokemon = dataLoader.pokemon
            print(self.pokemon)
        }
    }
    
    
    func convertPokemonToFavType(pokemon: [Pokemon]) -> [FavoritePokemon] {
        var favorites: [FavoritePokemon] = []
        
        for pokemon in pokemon {
            let favoritePokemon = FavoritePokemon(id: pokemon.id,
                                                  name: pokemon.name,
                                                  type: pokemon.type,
                                                  imageUrl: pokemon.imageUrl,
                                                  description: pokemon.description,
                                                  isFavorite: false)
            favorites.append(favoritePokemon)
        }
        return favorites
    }
    
    
    func load() {
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
    
    
    func sort() {
        self.pokemon = self.pokemon.sorted(by: { $0.id < $1.id })
    }
    
    
}
