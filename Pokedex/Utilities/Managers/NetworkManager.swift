//
//  NetworkManager.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation
//
//final class NetworkManager {
//    static let shared = NetworkManager()
//    private let baseUrl = "https://pokeapi.co/api/v2/"
//    private let pokemonPerPage = 20
//    
//    
//    func getPokemon(offset: Int, completed: @escaping (Result<[Pokemon], PError>) -> Void) {
//        let endPoint = baseUrl + "pokemon?offset=\(offset)&;amp;limit=20"
//        
//        guard let url = URL(string: endPoint) else {
//            completed(.failure(.invalidUsername))
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            if let _ = error {
//                completed(.failure(.unableToComplete))
//            }
//            
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                completed(.failure(.invalidResponse))
//                return
//            }
//            
//            guard let data = data else {
//                completed(.failure(.invalidData))
//                return
//            }
//            
//            do {
//                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
//                let response = try decoder.decode( PokemonResponse.self, from: data)
//                let pokemon = response.results
//                completed(.success(pokemon))
//            } catch {
//                completed(.failure(.invalidData))
//            }
//            
//        }
//        
//        task.resume()
//    }
//    
//}
//.
//enum PError: String, Error{
//    
//    case invalidUsername = "This username created an invalid request. Please try again."
//    case unableToComplete = "Unable to complete your request. Please check your internet connection"
//    case invalidResponse = "Invalid response from the server. Please try again."
//    case invalidData = "The data received from the server is invalid. Please try again."
//    case unableToAddFavorite = "There was an error favoriting this user. Please try again."
//    case alreadyInFavorites = "You have already favorited this user. You must really like them 🤔."
//    
//}
