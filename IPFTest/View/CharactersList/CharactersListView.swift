//
//  CharactersListView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

struct CharactersListView: View {
    
    @StateObject private var viewModel = CharactersListViewModel()
    private var gridItemLayout = Array(repeating: GridItem(.flexible()), count: 2)

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.8)
                .ignoresSafeArea()

            contentView
                .navigationBarItems(trailing: filtersButton)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                            Text("Characters")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.green)
                    }
                }
        }
        .onAppear {
            Task {
                await self.viewModel.getCharactersList()
            }
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        switch viewModel.state {
        case .idle:
            EmptyView()
        case .loading:
            VStack(spacing: 6) {
                Text("Loading")
                    .font(.title)
            }
            .padding()
        case .loaded(let items):
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(items, id: \.id) { character in
                        NavigationLink {
                            CharacterDetailsView(character: character)
                        } label: {
                            CharacterView(character: character)
                                .cornerRadius(15)
                        }
                    }
                }
            }
            .padding()
        case .error:
            VStack(spacing: 6) {
                Text("Error")
                    .font(.title)
            }
            .padding()
        }
    }

    var filtersButton: some View {
        Button {
            print("Filter")
        } label: {
            NavigationLink {
                FiltersView()
            } label: {
                Image("icons8-filter-50")
            }
        }

    }
}
