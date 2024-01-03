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
                Color(.black)
                    .opacity(0.8)
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(SectionProvider.sections) { section in
                            NavigationLink {
                                SectionDetailsView()
                            } label: {
                                SectionView(section: section)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Choose section")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.green)
                    }
                }
            }
        }
        .navigationBarColor(.clear)
    }
}

#Preview {
    SectionsListView()
}
