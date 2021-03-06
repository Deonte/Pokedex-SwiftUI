//
//  Pokemon.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import Foundation

struct Pokemon: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let type: String
    let imageUrl: String
    let description: String
}

struct FavoritePokemon: Identifiable, Codable, Hashable {
    let id: Int
    let name: String
    let type: String
    let imageUrl: String
    let description: String
    var isFavorite: Bool = false
}
