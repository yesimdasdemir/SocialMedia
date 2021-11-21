//
//  PostDetailRouter.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 21.11.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol PostDetailRoutingLogic {
}

protocol PostDetailDataPassing {
  var dataStore: PostDetailDataStore? { get }
}

final class PostDetailRouter: NSObject, PostDetailRoutingLogic, PostDetailDataPassing {
  weak var viewController: PostDetailViewController?
  var dataStore: PostDetailDataStore?
  
  // MARK: Routing
  
  // MARK: Navigation
  
  // MARK: Passing data

}
