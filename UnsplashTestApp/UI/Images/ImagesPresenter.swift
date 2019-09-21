//
//  ImagesPresenter.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol ImagesViewToPresenterProtocol: AnyObject {
  func onViewLoaded()
  func onViewEvent(_ event: ImagesViewEvent)
}

protocol ImagesInteractorToPresenterProtocol: AnyObject {
  func onInteractorError(_ error: Error)
  func onInteractorSuccess(_ data: [Urls])
}

protocol ImagesModuleInput: Inputs {
  
}


final class ImagesPresenter: ImagesModuleInput {
  weak var view: ImagesPresenterToViewProtocol?
  var interactor: ImagesPresenterToInteractorProtocol?
  var router: ImagesRouter.Routes?
  
  var currentPage = 1
}


extension ImagesPresenter: ImagesViewToPresenterProtocol {
  func onViewLoaded() {
    interactor?.fetchItems(forPage: currentPage)
  }
  
  func onViewEvent(_ event: ImagesViewEvent) {
    switch event {
    case .onCollectionViewEvent(let event):
      switch event {
      case .onCellTapAction(let data):
        router?.toFullImage(data.full)
      case .onCellDeleteAction:
        break
      case .onPaginationInitialized:
        currentPage += 1
        if currentPage <= 10 {
          interactor?.fetchItems(forPage: currentPage)
        }
      }
    }
  }
}


extension ImagesPresenter: ImagesInteractorToPresenterProtocol {
  func onInteractorError(_ error: Error) {
    debugPrint(error.localizedDescription)
  }
  
  func onInteractorSuccess(_ data: [Urls]) {
    view?.setupItems(data)
  }
}
