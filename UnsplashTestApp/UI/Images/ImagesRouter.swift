//
//  ImagesRouter.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

protocol ImagesRoute {
  func toFullImage(_ imageString: String)
}

extension ImagesRoute where Self: BaseRouter {
  func toFullImage(_ imageString: String) {
    let imageVC = ImagePreviewBuilder.create()
    if var presenter = imageVC.presenter as? ImagePreviewModuleInput {
      presenter.imageString = imageString
    }
    open(imageVC.view.viewController, completion: nil, embeded: true)
  }
}

final class ImagesRouter: BaseRouter, ImagesRouter.Routes {
  typealias Routes = ImagesRoute
}
