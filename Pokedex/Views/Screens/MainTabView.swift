//
//  MainTabView.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/5/21.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var pokemonVM = PokemonViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                PokemonView(pokemonVM: pokemonVM)
            }
            .tabItem {
                Text(Constants.Text.pokemon.rawValue.capitalized)
                Image(Constants.Symbol.pokemon)
                    .renderingMode(.template)
            }
            
            FavoritesView(viewModel: pokemonVM)
                .tabItem {
                    Text(Constants.Text.favorites.rawValue.capitalized)
                    Image(systemName: Constants.Symbol.starFilled)
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
