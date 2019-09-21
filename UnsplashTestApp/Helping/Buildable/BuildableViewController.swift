//
//  BuildableViewController.swift
//  FNX-SDK
//
//  Created by Maksym Balukhtin on 7/18/19.
//

import UIKit

public protocol Modulable {
  var viewController: UIViewController { get }
}

extension UIViewController: Modulable { }

extension Modulable where Self: UIViewController {
  public var viewController: UIViewController { return self }
}

public class BuildableViewController<View: UIView>: UIViewController {
  var mainView: View
  
  public override func loadView() {
    view = mainView
  }
  
  public init(view: View = View()) {
    mainView = view
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable) public required init?(coder aDecoder: NSCoder) {
    fatalError("Use init() instead")
  }
  
  var isKeyboardHandlable = false {
    didSet {
      if isKeyboardHandlable {
        assignClosing()
      }
    }
  }
  
  private func assignClosing() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
    mainView.addGestureRecognizer(tap)
  }
  
  @objc func closeKeyboard() {
    DispatchQueue.main.async { [unowned self] in
      self.mainView.endEditing(true)
    }
  }
  
  public override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    if #available(iOS 11, *) { } else {
      navigationController?.navigationBar.isTranslucent = false
    }
  }
}
