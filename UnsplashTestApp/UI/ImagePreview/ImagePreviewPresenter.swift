//
//  ImagePreviewPresenter.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

protocol ImagePreviewViewToPresenterProtocol: AnyObject {
  func onViewLoaded()
  func onViewEvent(_ event: ImagePreviewViewEvent)
}

protocol ImagePreviewModuleInput: Inputs {
  var imageString: String? { get set }
}


final class ImagePreviewPresenter: ImagePreviewModuleInput {
  weak var view: ImagePreviewPresenterToViewProtocol?
  var router: ImagePreviewRouter.Routes?
  
  //Module input
  var imageString: String?
}


extension ImagePreviewPresenter: ImagePreviewViewToPresenterProtocol {
  func onViewLoaded() {
    guard let imageString = imageString else { return }
    view?.setupInitialState(withImage: imageString)
  }
  
  func onViewEvent(_ event: ImagePreviewViewEvent) {
    switch event {
    case .onCloseButtonAction:
      router?.toClose()
    }
  }
}
