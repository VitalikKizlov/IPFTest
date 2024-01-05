//
//  SectionView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

struct SectionView: View {
    let section: Section

    var body: some View {
        ZStack {
            Image(section.imageName)
                .resizable()
                .frame(height: 200)
                .overlay(Color.primary.colorInvert().opacity(0.5), alignment: .center)
                .cornerRadius(15)

            Text(section.sectionType.title)
                .font(.system(size: 24, weight: .semibold))
                .foregroundColor(.black)
        }
    }
}

#Preview {
    SectionView(section: SectionProvider.sections[2])
}
