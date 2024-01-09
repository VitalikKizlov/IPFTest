//
//  EmptyResponseView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 09.01.2024.
//

import SwiftUI

struct EmptyResponseView: View {
    var body: some View {
        ZStack {
            Color(.primaryBlack)
                .ignoresSafeArea()

            VStack {
                Image("rick_morty_nothing")
                    .resizable()
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.5)

                Text("Look, Morty!")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.primaryGreen)
                Text("There's nothing there!")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.primaryGreen)
            }
        }
    }
}

#Preview {
    EmptyResponseView()
}
