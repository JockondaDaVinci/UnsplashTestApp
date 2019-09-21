//
//  ImagesModel.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

struct ImagesModel: Codable {
  let urls: Urls
}

struct Urls: Codable {
  let raw, full, regular, small, thumb: String
}
