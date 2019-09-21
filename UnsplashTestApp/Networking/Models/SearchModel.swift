//
//  SearchModel.swift
//  UnsplashTestApp
//
//  Created by Maksym Balukhtin on 9/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

struct SearchModel: Codable {
  let results: [Result]
}

struct Result: Codable {
  let urls: Urls
}
