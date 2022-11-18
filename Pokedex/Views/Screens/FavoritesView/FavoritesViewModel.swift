//
//  PersistenceManager.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import Foundation

final class StorageManager {
    enum FileURL {
        static let favorites = "favoritePokemon.data"
        static let allPokemon = "pokemon.json"
    }
    
    static let shared = StorageManager()
    private init() { }
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
   
    func save(_ pokemon: [FavorablePokemon], to fileURL: String) {
        do {
            let url = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
                .appendingPathComponent(fileURL)
            
            try encoder
                .encode(pokemon)
                .write(to: url)
        } catch {
            print("Error saving pokemon")
        }
    }
    
    func loadPokemon(from fileURL: String) -> [FavorablePokemon] {
        do {
            let url = try FileManager.default
                .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(fileURL)
            
            let data = try Data(contentsOf: url)
            let favoritePokemon = try decoder.decode([FavorablePokemon].self, from: data)
            return favoritePokemon
        } catch {
            print("Error reading json data.")
            return []
        }
    }
}

extension StorageManager {
    func saveFavorite(pokemon: FavorablePokemon) {
        var allPokemon = loadPokemon(from: FileURL.allPokemon)
        if let index = allPokemon.firstIndex(of: pokemon) {
            allPokemon[index].isFavorite = true
            print("It's now true")
        }
        save(allPokemon, to: FileURL.allPokemon)
    }
    
    func removeFavorite(pokemon: FavorablePokemon) {
        var allPokemon = loadPokemon(from: FileURL.allPokemon)
        if let index = allPokemon.firstIndex(of: pokemon) {
            allPokemon[index].isFavorite = false
            print("It's now false")
        }
        save(allPokemon, to: FileURL.allPokemon)
    }
    
}
