//
//  Extension.swift
//  IPFTest
//
//  Created by Vitalii Kizlov on 05.01.2024.
//

import UIKit

extension UINavigationController {
  open override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    navigationBar.topItem?.backButtonDisplayMode = .minimal
  }
}
