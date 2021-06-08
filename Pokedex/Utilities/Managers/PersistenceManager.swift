//
//  PersistenceManager.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import Foundation

enum persistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    enum Keys { static let favorites = "favorites" }
    
    
    static func updateWith(favorite: FavoritePokemon, actionType: persistenceActionType, completed: @escaping (PokeError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll { $0.id == favorite.id }
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case.failure(let error):
                completed(error)
            }
        }
    }
    
    
    static func retrieveFavorites(completed: @escaping (Result<[FavoritePokemon], PokeError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode( [FavoritePokemon].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToAddFavorite))
        }
    }
    
    
    static func save(favorites: [FavoritePokemon]) -> PokeError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToAddFavorite
        }

    }
}
