//
//  ImagePreviewViewController.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation
import UIKit

enum ImagePreviewViewEvent {
  case onCloseButtonAction
}


protocol ImagePreviewPresenterToViewProtocol: AnyObject {
  func setupInitialState(withImage imageString: String)
}


final class ImagePreviewViewController: BuildableViewController<ImagePreviewView> {
  var presenter: ImagePreviewViewToPresenterProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.onViewLoaded()
  }
}


extension ImagePreviewViewController: ImagePreviewPresenterToViewProtocol {
  func setupInitialState(withImage imageString: String) {
    mainView.imageView.downloaded(fromURL: imageString)
    setupActions()
  }
}


private extension ImagePreviewViewController {
  func setupActions() {
    mainView.closeButton.addAction(for: .touchUpInside) { [unowned self] in
      self.presenter?.onViewEvent(.onCloseButtonAction)
    }
  }
}
