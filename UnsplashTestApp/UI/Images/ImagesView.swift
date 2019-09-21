//
//  ImagesView.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

class ImagesView: BuildableView {
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  
  override func addViews() {
    [collectionView].forEach{addSubview($0)}
  }
  
  override func anchorViews() {
    collectionView.fillSuperview()
  }
  
  override func configureViews() {
    collectionView.isPrefetchingEnabled = true
    collectionView.bounces = true
    collectionView.backgroundColor = .white
    
    collectionView.register(cell: ImageCell.self)
    collectionView.registerSupplementary(FooterCell.self)
  }
}

