//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @EnvironmentObject var modelData: DataLoader
    var pokemon: FavoritePokemon
    
    var pokemonIndex: Int {
        modelData.pokemon.firstIndex(where: { $0.id == pokemon.id })!
    }
    
    var body: some View {
        VStack {
            KFImage(URL(string: pokemon.imageUrl))
                .padding()
            Image(pokemon.type.capitalized)
            Text(pokemon.description.removeN())
                .font(.body)
                .padding()
            Spacer()
            FavoriteButton(isSet: $modelData.pokemon[pokemonIndex].isFavorite)
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: MockData.pokemon)
    }
}
