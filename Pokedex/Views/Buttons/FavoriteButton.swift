//
//  FavoriteButton.swift
//  Pokedex
//
//  Created by Deonte Kilgore on 6/6/21.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    var body: some View {
        HStack {
            Button(action: {
                isSet.toggle()
            }, label: {
                HStack {
                    Image(systemName: isSet ? "star.fill" : "star")
                        .resizable()
                        .foregroundColor(Color(.white))
                        .frame(width: 20, height: 20)
                    
                    Text(isSet ? "Remove" : "Favorite")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .padding(.vertical, 15)
                }
                .padding(.horizontal, 50)
                .background(Color(isSet ? .systemYellow : .lightGray))
                .cornerRadius(20)
            })
        }
        .padding(.bottom, 20)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
