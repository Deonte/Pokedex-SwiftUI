//
//  MockData.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct MockData {
    static let pokemon = FavoritePokemon (
        id: 6,
        name: "Charizard",
        type: "fire",
        imageUrl:"https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F5331AA3F-D45A-4BAA-AEEF-A1B02DBA338B?alt=media&;amp;token=a905d491-c781-4154-a659-1906a6cdb69a",
        description: "Charizard flies around the sky in search of powerful opponents.\nIt breathes fire of such great heat that it melts anything.\nHowever, it never turns its fiery breath on any opponent\nweaker than itself.",
        isFavorite: true
    )
}

