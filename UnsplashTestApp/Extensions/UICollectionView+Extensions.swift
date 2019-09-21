//
//  UICollectionView+Extensions.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

extension UICollectionView {
  func register<T: UICollectionViewCell>(cell: T.Type) {
    register(T.self, forCellWithReuseIdentifier: cell.reuseId)
  }
  
  func registerSupplementary<T: UIView>(_ view: T.Type) {
    register(T.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: T.reuseId)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(ofType type: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: type.reuseId, for: indexPath) as! T
  }
}
