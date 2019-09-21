//
//  BuildableCollectionCell.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

class BuildableCollectionCell<View: UIView>: UICollectionViewCell {
  var mainView: View
  
  override init(frame: CGRect) {
    self.mainView = View()
    super.init(frame: frame)
    contentView.addSubview(mainView)
    mainView.fillSuperview()
  }
  
  @available (*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("required init not implemented")
  }
}
