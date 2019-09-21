//
//  ViewController.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    tabBar.barTintColor = .black
    
    let imagesVC = ImagesBuilder.create().view.viewController
    imagesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
    
    let searchVC = UINavigationController(rootViewController: SearchBuilder.create().view.viewController)
    searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
    
    viewControllers = [imagesVC, searchVC]
  }
  
}

