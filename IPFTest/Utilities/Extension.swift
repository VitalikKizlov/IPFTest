//
//  Extension.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import UIKit
import SwiftUI

extension UINavigationController {
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}

extension Array {
    mutating func mutateEach(by transform: (inout Element) throws -> Void) rethrows {
        self = try map { el in
            var el = el
            try transform(&el)
            return el
        }
    }
}

extension View {
    func customToolbar(title: String) -> some View {
        return self.modifier(CustomToolBarModifier(title: title))
    }
}
