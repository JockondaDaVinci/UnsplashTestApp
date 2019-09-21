//
//  ImagePreviewView.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

class ImagePreviewView: BuildableView {
  let closeButton = UIButton()
  let imageView = UIImageView()
  
  override func addViews() {
    [imageView, closeButton].forEach{addSubview($0)}
  }
  
  override func anchorViews() {
    imageView.fillSuperview()
    
    closeButton
      .anchorTop(safeAreaLayoutGuideAnyIOS.topAnchor, 10)
      .anchorRight(rightAnchor, 10)
      .anchorHeight(30)
      .anchorWidth(30)
  }
  
  override func configureViews() {
    backgroundColor = .black
    
    imageView.contentMode = .scaleAspectFit
    
    closeButton.setTitle("X", for: .normal)
    closeButton.setTitleColor(.lightGray, for: .normal)
  }
}

