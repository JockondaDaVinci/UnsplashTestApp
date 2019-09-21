//
//  ImagePreviewModuleFactory.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

final class ImagePreviewBuilder: BaseBuilder {
  static func create() -> (presenter: Inputs, view: Modulable, router: BaseRouter) {
    let view = ImagePreviewViewController()
    let presenter = ImagePreviewPresenter()
    let router = ImagePreviewRouter()
    
    view.presenter = presenter
    
    presenter.view = view
    presenter.router = router
    
    router.view = view
    
    return (presenter, view, router)
  }
}
