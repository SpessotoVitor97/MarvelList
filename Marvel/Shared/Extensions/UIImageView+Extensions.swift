//
//  UIImageView+Extensions.swift
//  Marvel
//
//  Created by Vitor Spessoto on 13/02/22.
//

import UIKit

extension UIImageView {
    public func downloadImage(withURL URLString: String) {
        if let url = URL(string: URLString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    self.alpha = 0.5
                    UIView.animate(withDuration: 0.5) {
                        self.image = UIImage(data: data!)
                        self.alpha = 1
                        self.layoutIfNeeded()
                    }
                }
            }.resume()
        }
    }
}
