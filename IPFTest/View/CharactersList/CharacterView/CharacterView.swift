//
//  CharacterView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import SwiftUI
import Kingfisher

struct CharacterView: View {
    let character: Character

    var body: some View {
        ZStack(alignment: .bottom) {
            KFImage.url(URL(string: character.image))
                .resizable()
                .frame(height: 180)
            
            Text(character.name)
                .font(.headline)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding([.all], 6)
                .background(Color.primary.colorInvert().opacity(0.75))
        }
    }
}
