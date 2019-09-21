//
//  SearchManager.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

enum SearchBarEvent {
  case onTextChanged(String, Bool)
}

class SearchManager: NSObject {
  var eventHandler: EventHandler<SearchBarEvent>?
  private var searchQuery = ""
  
  init(searchBar: UISearchBar) {
    super.init()
    searchBar.delegate = self
  }
}

extension SearchManager: UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    eventHandler?(.onTextChanged(searchText, searchText.count > 3))
  }
}
