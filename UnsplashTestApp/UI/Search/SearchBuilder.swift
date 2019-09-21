//
//  SearchModuleFactory.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

final class SearchBuilder: BaseBuilder {
  static func create() -> (presenter: Inputs, view: Modulable, router: BaseRouter) {
    let view = SearchViewController()
    let presenter = SearchPresenter()
    let interactor = SearchInteractor()
    let router = ImagesRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.interactor = interactor
    presenter.router = router
    
    interactor.presenter = presenter
    interactor.networkManager = NetworkManager.shared
    
    router.view = view
    
    return (presenter, view, router)
  }
}
