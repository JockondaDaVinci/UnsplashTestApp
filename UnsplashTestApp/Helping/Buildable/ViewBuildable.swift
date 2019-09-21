//
//  ViewBuildable.swift
//  FNX-SDK
//
//  Created by Maksym Balukhtin on 7/16/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

public class BuildableView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    addViews()
    configureViews()
    anchorViews()
  }
  
  @available(*, unavailable) required init?(coder aDecoder: NSCoder) {
    fatalError("not implemented")
  }
  
  public func addViews() { }
  
  public func configureViews() { }
  
  public func anchorViews() { }
}
