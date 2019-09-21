//
//  ImagesModuleFactory.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

final class ImagesBuilder: BaseBuilder {
  static func create() -> (presenter: Inputs, view: Modulable, router: BaseRouter) {
    let view = ImagesViewController()
    let presenter = ImagesPresenter()
    let interactor = ImagesInteractor()
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
