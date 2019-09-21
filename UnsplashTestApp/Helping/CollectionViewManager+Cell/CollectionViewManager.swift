//
//  CollectionViewManager.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

enum CollectionViewManagerEvent {
  case onCellTapAction(Urls)
  case onCellDeleteAction(IndexPath)
  case onPaginationInitialized
}

final class CollectionViewManager: NSObject {
  enum PresentationStyle {
    case flow
    case search
    
    var itemsPerRow: Int {
      switch self {
      case .flow: return 3
      case .search: return 1
      }
    }
  }
  
  var eventHandler: EventHandler<CollectionViewManagerEvent>?
  
  private var collectionView: UICollectionView
  private var items: [Urls]
  private var presentationStyle: PresentationStyle
  
  init(items: [Urls], presentationStyle: PresentationStyle, collectionView: UICollectionView) {
    self.items = items
    self.presentationStyle = presentationStyle
    self.collectionView = collectionView
    
    super.init()
    
    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension CollectionViewManager: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = items[indexPath.item]
    eventHandler?(.onCellTapAction(item))
  }
}

extension CollectionViewManager: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(ofType: ImageCell.self, for: indexPath)
    let item = items[indexPath.item]
    if presentationStyle == .flow {
      cell.configure(imageString: item.thumb)
    } else {
      cell.configure(imageString: item.regular) { [weak self] in
        self?.eventHandler?(.onCellDeleteAction(indexPath))
      }
    }
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: FooterCell.reuseId, for: indexPath)
    return view
  }
}

extension CollectionViewManager: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let interitemSpacing = (collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0.0
    
    let threeInRow = (UIScreen.main.bounds.width / 3.0) - interitemSpacing
    let singleInRow = collectionView.frame.width
    
    let size = presentationStyle == .flow ? CGSize(width: threeInRow, height: threeInRow) : CGSize(width: singleInRow, height: singleInRow)
    return size
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 10)
  }
  
  func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
    guard elementKind == UICollectionView.elementKindSectionFooter else { return }
    eventHandler?(.onPaginationInitialized)
  }
}

extension CollectionViewManager {
  func deleteItems(at indexPathes: [IndexPath]) {
    indexPathes.forEach {
      items.remove(at: $0.item)
    }
    
    collectionView.deleteItems(at: indexPathes)
  }
}
