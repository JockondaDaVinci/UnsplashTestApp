//
//  ImageCellView.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

class ImageCellView: BuildableView {
  let imageView = UIImageView()
  let deleteButton = UIButton()
  
  override func addViews() {
    [imageView, deleteButton].forEach { addSubview($0) }
  }
  
  override func anchorViews() {
    imageView.fillSuperview()
    
    deleteButton
      .anchorTop(topAnchor, 0)
      .anchorRight(rightAnchor, 0)
      .anchorHeight(15)
      .anchorWidth(15)
  }
  
  override func configureViews() {
    imageView.contentMode = .scaleAspectFit
    
    deleteButton.setTitle("X", for: .normal)
    deleteButton.setTitleColor(.black, for: .normal)
    deleteButton.isHidden = true
  }
}
