//
//  BaseBuilder.swift
//  FNX-SDK
//
//  Created by Maksym Balukhtin on 7/19/19.
//

import Foundation

protocol BaseBuilder {
  static func create() -> (presenter: Inputs, view: Modulable, router: BaseRouter)
}

protocol Inputs {
  
}
