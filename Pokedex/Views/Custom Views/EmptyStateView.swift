//
//  EmptyStateView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Text("No Favorites?\nAdd one on the\nPokemon screen.")
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(Color(.secondaryLabel))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                
                Spacer()

                Image(Constants.Text.pokemon.rawValue)
                    .resizable()
                    .scaledToFit()
                    .offset(x: 100, y: 0)
            }
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
