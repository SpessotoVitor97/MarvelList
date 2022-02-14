//
//  UIVew+Extensions.swift
//  Marvel
//
//  Created by Vitor Spessoto on 14/02/22.
//

import UIKit

extension UIView {
    func pinEdges(to parent: UIView) {
        DispatchQueue.main.async {
            self.translatesAutoresizingMaskIntoConstraints = false
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
            self.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive = true
        }
    }
}
