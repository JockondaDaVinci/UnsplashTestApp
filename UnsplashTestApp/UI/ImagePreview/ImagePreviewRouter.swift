//
//  ImagePreviewRouter.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

protocol ImagePreviewRoute {
  func toClose()
}

extension ImagePreviewRoute where Self: BaseRouter {
  func toClose() {
    close(completion: nil)
  }
}

final class ImagePreviewRouter: BaseRouter, ImagePreviewRouter.Routes {
  typealias Routes = ImagePreviewRoute
}
