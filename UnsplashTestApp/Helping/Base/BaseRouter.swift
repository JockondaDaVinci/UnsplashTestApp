//
//  BaseRouter.swift
//  FNX-SDK
//
//  Created by Maksym Balukhtin on 7/18/19.
//

import UIKit

public protocol BaseRouterProtocol {
  var view: Modulable? { get set }
  func open(_ viewController: UIViewController?, completion: VoidClosure?, embeded: Bool)
  func close(completion: VoidClosure?)
  func navigationBuilded(for viewController: UIViewController, title: String) -> UIViewController
}

extension BaseRouterProtocol {
  var viewController: UIViewController? {
    return view?.viewController
  }
  
  public func open(_ viewController: UIViewController?, completion: VoidClosure?, embeded: Bool = false) {
    guard let viewController = viewController else {
      fatalError("ViewController does not exist")
    }
    
    if self.viewController?.navigationController != nil && !embeded {
      self.viewController?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
      self.viewController?.navigationController?.pushViewController(viewController, animated: true)
    } else {
      self.viewController?.present(viewController, animated: true, completion: completion)
    }
  }
  
  public func close(completion: VoidClosure?) {
    guard let viewController = viewController else {
      fatalError("ViewController does not exist")
    }
    viewController.dismiss(animated: true, completion: completion)
  }
  
  public func navigationBuilded(for viewController: UIViewController, title: String) -> UIViewController {
    let nav = UINavigationController(rootViewController: viewController)
    viewController.title = title
    return nav
  }
}

public class BaseRouter: BaseRouterProtocol {
  public var view: Modulable?
}
