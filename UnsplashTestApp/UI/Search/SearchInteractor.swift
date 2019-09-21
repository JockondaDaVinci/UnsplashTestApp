//
//  SearchInteractor.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol SearchPresenterToInteractorProtocol: AnyObject {
  func fetchItems(forQuery query: String)
}


final class SearchInteractor {
  weak var presenter: SearchInteractorToPresenterProtocol?
  weak var networkManager: NetworkManager?
}


extension SearchInteractor: SearchPresenterToInteractorProtocol {
  func fetchItems(forQuery query: String) {
    networkManager?.startTask(forURL: API.search(byQuery: query), type: SearchModel.self, completion: { [unowned self] data, error in
      if error != nil || data == nil {
        self.presenter?.onInteractorError(error!)
        return
      }
      
      let urls = data!.results.map { $0.urls }
      self.presenter?.onInteractorSuccess(urls)
    })
  }
}
