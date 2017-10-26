//
//  UIKit.UIView.swift
//  MyVibe
//
//  Created by Piotr Torczyński on 26/10/2017.
//  Copyright © 2017 SmartApps. All rights reserved.
//

import UIKit

extension UIView {
    // Constraints
    func constrainEdges(to view: UIView, insets: UIEdgeInsets = .zero) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right),
        ])
    }
}
