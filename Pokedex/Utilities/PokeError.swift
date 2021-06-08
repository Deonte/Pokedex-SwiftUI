//
//  PokeError.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import Foundation


enum PokeError: String, Error {
    case unableToAddFavorite = "There was an error favoriting this Pokemon. Please try again."
    case alreadyInFavorites = "You have already favorited this Pokemon. You must really like them 🤔."
}
