//
//  LaunchScreenViewModel.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 03.01.2024.
//

import Foundation

final class LaunchScreenViewModel: ObservableObject {
    enum LaunchScreenState {
        case active, inactive
    }

    @Published private(set) var state: LaunchScreenState = .active

    @MainActor func dismissLaunchScreen() {
        Task {
            try await Task.sleep(nanoseconds: 1_500_000_000)
            self.state = .inactive
        }
    }
}
