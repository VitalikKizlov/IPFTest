//
//  ContentView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

struct SectionsListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.primaryBlack)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(SectionProvider.sections) { section in
                            NavigationLink {
                                switch section.sectionType {
                                case .characters:
                                    CharactersListView()
                                case .episodes:
                                    EmptyView()
                                case .locations:
                                    EmptyView()
                                }
                            } label: {
                                SectionView(section: section)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .customToolbar(title: "Choose section")
            }
        }
        .accentColor(.primaryGreen)
    }
}

#Preview {
    SectionsListView()
}
