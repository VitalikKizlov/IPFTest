//
//  ContentView.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var launchScreenViewModel: LaunchScreenViewModel

    var body: some View {
        VStack {
            Text("Image")
        }
        .onAppear(perform: {
            Task {
                self.launchScreenViewModel.dismissLaunchScreen()
            }
        })
    }
}

#Preview {
    ContentView(launchScreenViewModel: LaunchScreenViewModel())
}
