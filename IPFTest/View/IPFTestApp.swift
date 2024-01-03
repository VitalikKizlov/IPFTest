//
//  IPFTestApp.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import SwiftUI

@main
struct IPFTestApp: App {
    @ObservedObject var launchScreenViewModel = LaunchScreenViewModel()

    var body: some Scene {
        WindowGroup {
            VStack {
                if launchScreenViewModel.state == .active {
                    LaunchScreenView()
                } else {
                    SectionsListView()
                }
            }
            .onAppear(perform: {
                Task {
                    self.launchScreenViewModel.dismissLaunchScreen()
                }
            })
        }
    }
}
