//
//  ImagesViewController.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation
import UIKit

enum ImagesViewEvent {
  case onCollectionViewEvent(CollectionViewManagerEvent)
}


protocol ImagesPresenterToViewProtocol: AnyObject {
  func setupItems(_ items: [Urls])
}


final class ImagesViewController: BuildableViewController<ImagesView> {
  var presenter: ImagesViewToPresenterProtocol?
  var collectionManager: CollectionViewManager?
  var currentItems = [Urls]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewLoaded()
  }
}


extension ImagesViewController: ImagesPresenterToViewProtocol {
  func setupItems(_ items: [Urls]) {
    currentItems.append(contentsOf: items)
    collectionManager = CollectionViewManager(items: currentItems, presentationStyle: .flow, collectionView: mainView.collectionView)
    setupActions()
  }
}


private extension ImagesViewController {
  func setupActions() {
    collectionManager?.eventHandler = { [unowned self] event in
      self.presenter?.onViewEvent(.onCollectionViewEvent(event))
    }
  }
}
