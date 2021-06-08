//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: FavoritePokemon
      
    var body: some View {
        HStack {
            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 70)
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(pokemon.name.capitalized)
                        .foregroundColor(Color(.label))
                        .font(.system(size: 28, weight: .medium))
                        .frame(height: 30, alignment: .leading)
                    if pokemon.isFavorite {
                        Image(systemName: "star.fill")
                            .resizable()
                            .foregroundColor(Color(.systemYellow))
                            .frame(width: 20, height: 20)
                    }
                }
                Text("\(pokemon.id.format(pattern: "#%03d"))")
                    .foregroundColor(Color(.tertiaryLabel))
                    .font(.system(size: 22))
                    .frame(height: 30, alignment: .leading)
            }
            
            Spacer()

            HStack(spacing: 5) {
                Image("small\(pokemon.type.capitalized)")
                    .resizable()
                    .frame(width: 50, height: 50)
            }
        }
        .frame(height: 90)
    }
}

struct PokemonCell_Previews: PreviewProvider {
    static var previews: some View {
        PokemonCell(pokemon: MockData.pokemon)
    }
}
