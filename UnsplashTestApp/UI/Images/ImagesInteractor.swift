//
//  ImagesInteractor.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol ImagesPresenterToInteractorProtocol: AnyObject {
  func fetchItems(forPage page: Int)
}


final class ImagesInteractor {
  weak var presenter: ImagesInteractorToPresenterProtocol?
  weak var networkManager: NetworkManager?
}


extension ImagesInteractor: ImagesPresenterToInteractorProtocol {
  func fetchItems(forPage page: Int) {
    networkManager?.startTask(forURL: API.photos(forPage: page), type: [ImagesModel].self, completion: { [unowned self] data, error in
      if error != nil || data == nil {
        self.presenter?.onInteractorError(error!)
        return
      }
      
      let urls = data!.map { $0.urls }
      self.presenter?.onInteractorSuccess(urls)
    })
  }
}
