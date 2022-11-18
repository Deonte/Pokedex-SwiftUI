//
//  PokemonDetailView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI
import Kingfisher

struct PokemonDetailView: View {
    @Binding var pokemon: FavorablePokemon
    
    enum Mode {
       case normal
       case favorite
   }
    @State var mode: Mode = .normal

    var body: some View {
        VStack {
            if mode == .normal {
                KFImage(URL(string: pokemon.imageUrl))
                    .padding()
                Image(pokemon.type.capitalized)
                Text(pokemon.description.removeN())
                    .font(.body)
                    .padding()
                Spacer()
                FavoriteButton(pokemon: $pokemon)
            } else if mode == .favorite {
                KFImage(URL(string: pokemon.imageUrl))
                    .padding()
                Image(pokemon.type.capitalized)
                Text(pokemon.description.removeN())
                    .font(.body)
                    .padding()
                Spacer()
            }
        }
        .navigationTitle(pokemon.name.capitalized)
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: .constant(MockData.pokemon), mode: .normal)
    }
}

private struct FavoriteButton: View {
    @Binding var pokemon: FavorablePokemon
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        HStack {
            Button(action: {
                pokemon.isFavorite.toggle()
            }, label: {
                HStack {
                    Image(systemName: pokemon.isFavorite ? Constants.Symbol.starFilled : Constants.Symbol.star)
                        .resizable()
                        .foregroundColor(Color(.white))
                        .frame(width: 20, height: 20)
                    
                    Text(pokemon.isFavorite ? "Remove" : "Favorite")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 15)
                }
                .padding(.horizontal, 50)
                .background(Color(pokemon.isFavorite ? .systemYellow : .lightGray))
                .cornerRadius(20)
            })
        }
        .padding(.bottom, 20)
    }
}
