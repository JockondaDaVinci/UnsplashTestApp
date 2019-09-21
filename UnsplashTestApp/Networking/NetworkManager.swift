//
//  NetworkManager.swift
//  FNX-SDK
//
//  Created by Maksym Balukhtin on 7/21/19.
//  Copyright © 2019 Maksym Balukhtin. All rights reserved.
//

import Foundation

enum NetworkError: Error {
  case invalidURL
  case dataIsEmpty
}

class NetworkManager {
  private var session: URLSession
  
  static let shared = NetworkManager()
  
  init() {
    let configuration = URLSessionConfiguration.ephemeral
    configuration.requestCachePolicy = .reloadIgnoringCacheData
    session = URLSession(configuration: configuration)
  }
  
  func startTask<ObjectType: Codable>(forURL url: String, type: ObjectType.Type, usingCookies cookies: [HTTPCookie] = [], completion: @escaping (ObjectType?, Error?) -> ()) {
    guard let url = URL(string: url) else {
      completion(nil, NetworkError.invalidURL)
      return
    }
    
    session.dataTask(with: url) { data, response, error in
      if error != nil || data == nil {
        completion(nil, error)
        return
      }
      
      do {
        let decoder = JSONDecoder()
        let object = try decoder.decode(ObjectType.self, from: data!)
        DispatchQueue.main.async {
          completion(object, nil)
        }
      } catch {
        completion(nil, error)
      }
    }.resume()
  }
  
  func downloadImage(forURL urlStr: String, completion: @escaping (Data?, Error?) -> ()) {
    guard let url = URL(string: urlStr) else { return }
    session.dataTask(with: url) { data, response, error in
      if error != nil || data == nil {
        completion(nil, error)
        return
      }
      DispatchQueue.main.async {
        completion(data, error)
      }
    }.resume()
  }
}
