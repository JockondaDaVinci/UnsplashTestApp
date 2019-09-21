//
//  SearchViewController.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation
import UIKit

enum SearchViewEvent {
  case onCollectionViewEvent(CollectionViewManagerEvent)
  case onSearchBarEvent(SearchBarEvent)
}


protocol SearchPresenterToViewProtocol: AnyObject {
  func setupInitialState()
  func setupItems(_ items: [Urls])
  func deleteDesignatedCell(at indexPath: IndexPath)
}


final class SearchViewController: BuildableViewController<SearchView> {
  var presenter: SearchViewToPresenterProtocol?
  var collectionManager: CollectionViewManager?
  var searchManager: SearchManager?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewFirstWillAppear()
  }
}


extension SearchViewController: SearchPresenterToViewProtocol {
  func setupInitialState() {
    setupUI()
  }
  
  func setupItems(_ items: [Urls]) {
    collectionManager = CollectionViewManager(items: items, presentationStyle: .search, collectionView: mainView.collectionView)
    setupCollectionAction()
  }
  
  func deleteDesignatedCell(at indexPath: IndexPath) {
    collectionManager?.deleteItems(at: [indexPath])
  }
}


private extension SearchViewController {
  func setupUI() {
    navigationItem.titleView = mainView.searchBar
    searchManager = SearchManager(searchBar: mainView.searchBar)
    setupSearchAction()
  }
  
  func setupCollectionAction() {
    collectionManager?.eventHandler = { [unowned self] event in
      self.presenter?.onViewEvent(.onCollectionViewEvent(event))
    }
  }
  
  func setupSearchAction() {
    searchManager?.eventHandler = { [unowned self] event in
      self.presenter?.onViewEvent(.onSearchBarEvent(event))
    }
  }
}
