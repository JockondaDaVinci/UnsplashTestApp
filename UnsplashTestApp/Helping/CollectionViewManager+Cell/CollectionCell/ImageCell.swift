//
//  ImageCell.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

final class ImageCell: BuildableCollectionCell<ImageCellView> {
  func configure(imageString: String, action: VoidClosure? = nil) {
    mainView.imageView.downloaded(fromURL: imageString)
    mainView.deleteButton.addAction(for: .touchUpInside, action: action)
    mainView.deleteButton.isHidden = action == nil
  }
}
