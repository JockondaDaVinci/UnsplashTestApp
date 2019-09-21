//
//  UIImageView+Extensions.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

extension UIImageView {
  @objc func downloaded(fromURL url: String) {
    NetworkManager.shared.downloadImage(forURL: url) { imageData, error in
      guard let data = imageData else { return }
      self.image = UIImage(data: data)
    }
  }
}
