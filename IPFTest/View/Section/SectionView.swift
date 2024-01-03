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
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(15)
                .opacity(0.5)

            Text(section.sectionType.title)
                .font(.system(size: 24, weight: .semibold))
        }
    }
}

#Preview {
    SectionView(section: SectionProvider.sections[0])
}
