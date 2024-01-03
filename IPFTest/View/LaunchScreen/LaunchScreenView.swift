//
//  LaunchScreenView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack {
            Color(.black).opacity(0.8)
            VStack(spacing: 100) {
                Image("rickAndMorty")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                    .padding(.top, 80)


                Image("cucumber")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)

                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LaunchScreenView()
}
