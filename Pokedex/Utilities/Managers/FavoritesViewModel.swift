//
//  PersistenceManager.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import Foundation

@MainActor
final class FavoritesViewModel: ObservableObject {
    @Published var favoritePokemon: [FavorablePokemon] = []
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        loadPokemon()
    }
    
    private func save(_ pokemon: [FavorablePokemon]) {
        do {
            let url = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent("favoritePokemon.data")
            
            try encoder
                .encode(pokemon)
                .write(to: url)
        } catch {
            print("Error saving pokemon")
        }
    }
    
    func loadPokemon() {
        do {
            let url = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("favoritePokemon.data")
            
            let data = try Data(contentsOf: url)
            let favoritePokemon = try decoder.decode([FavorablePokemon].self, from: data)
           
            self.favoritePokemon = favoritePokemon
        } catch {
            print("Error reading json data.")
        }
    }
}

extension FavoritesViewModel {
    func saveToFavorite(pokemon: FavorablePokemon) {
        var favorites = favoritePokemon
        favorites.append(pokemon)
        save(favorites)
        favoritePokemon = favorites
        print("saved")
    }

    func removeFavorite(pokemon: FavorablePokemon) {
        var favorites = favoritePokemon
        if let index = favorites.firstIndex(of: pokemon) {
            favorites.remove(at: index)
        }
        save(favorites)
        favoritePokemon = favorites
        print("deleted")
    }
    
}
