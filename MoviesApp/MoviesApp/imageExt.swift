//
//  imageExt.swift
//  MoviesApp
//
//  Created by SalahAfia on 7/7/18.
//  Copyright © 2018 Joko. All rights reserved.
//

import Foundation

extension UIImageView {
    func loadFromURL(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
