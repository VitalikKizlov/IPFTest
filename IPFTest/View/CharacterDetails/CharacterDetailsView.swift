//
//  CharacterDetailsView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import SwiftUI
import Kingfisher

struct CharacterDetailsView: View {
    let character: Character

    var body: some View {
        ZStack {
            Color(.primaryBlack)
                .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 20) {
                KFImage.url(URL(string: character.image))
                    .resizable()
                    .frame(height: UIScreen.main.bounds.height * 0.4)
                    .cornerRadius(15)

                CharacterInformationView(character: character)

                Spacer()
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(character.name)
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.primaryGreen)
            }
        }
    }
}

struct CharacterInformationView: View {
    let character: Character

    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 12) {
                Text("Name:")
                    .foregroundColor(.primaryGreen)
                Text(character.name)
                    .foregroundColor(.white)
            }
            HStack(spacing: 12) {
                Text("Status:")
                    .foregroundColor(.primaryGreen)
                Text(character.status.rawValue)
                    .foregroundColor(.white)
            }
            HStack(spacing: 12) {
                Text("Species:")
                    .foregroundColor(.primaryGreen)
                Text(character.species)
                    .foregroundColor(.white)
            }
            HStack(spacing: 12) {
                Text("Gender:")
                    .foregroundColor(.primaryGreen)
                Text(character.gender.rawValue)
                    .foregroundColor(.white)
            }
        }
    }
}
