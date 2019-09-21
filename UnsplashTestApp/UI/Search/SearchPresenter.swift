//
//  SearchPresenter.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol SearchViewToPresenterProtocol: AnyObject {
  func onViewFirstWillAppear()
  func onViewEvent(_ event: SearchViewEvent)
}

protocol SearchInteractorToPresenterProtocol: AnyObject {
  func onInteractorError(_ error: Error)
  func onInteractorSuccess(_ items: [Urls])
}

protocol SearchModuleInput: Inputs {
  
}


final class SearchPresenter: SearchModuleInput {
  weak var view: SearchPresenterToViewProtocol?
  var interactor: SearchPresenterToInteractorProtocol?
  var router: ImagesRouter.Routes?
}


extension SearchPresenter: SearchViewToPresenterProtocol {
  func onViewFirstWillAppear() {
    view?.setupInitialState()
  }
  
  func onViewEvent(_ event: SearchViewEvent) {
    switch event {
    case .onCollectionViewEvent(let event):
      switch event {
      case .onCellTapAction(let item):
        router?.toFullImage(item.full)
      case .onCellDeleteAction(let indexPath):
        view?.deleteDesignatedCell(at: indexPath)
      case .onPaginationInitialized: break
      }
    case .onSearchBarEvent(let event):
      switch event {
      case .onTextChanged(let query, let isEnough):
        if isEnough {
          interactor?.fetchItems(forQuery: query)
        }
      }
    }
  }
}


extension SearchPresenter: SearchInteractorToPresenterProtocol {
  func onInteractorError(_ error: Error) {
    debugPrint(error.localizedDescription)
  }
  
  func onInteractorSuccess(_ items: [Urls]) {
    view?.setupItems(items)
  }
}
