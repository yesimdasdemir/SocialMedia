//
//  PostListRouter.swift
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

protocol PostListRoutingLogic {
    func routeToPostDetail(viewModel: SimpleItemViewModel)
}

protocol PostListDataPassing {
    var dataStore: PostListDataStore? { get }
}

final class PostListRouter: NSObject, PostListRoutingLogic, PostListDataPassing {
    
    weak var viewController: PostListViewController?
    var dataStore: PostListDataStore?
    
    // MARK: Routing
    
    func routeToPostDetail(viewModel: SimpleItemViewModel) {
        let storyboard = UIStoryboard(name: "PostDetail", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "PostDetail") as! PostDetailViewController
        var destinationDS = destinationVC.router!.dataStore!
        
        passDataToPostDetail(viewModel: viewModel, destination: &destinationDS)
        navigateToPostDetail(source: viewController!, destination: destinationVC)
       
    }
    
    //   MARK: Navigation
    
    func navigateToPostDetail(source: PostListViewController, destination: PostDetailViewController) {
        source.show(destination, sender: nil)
    }
    
    //   MARK: Passing data
    
    func passDataToPostDetail(viewModel: SimpleItemViewModel, destination: inout PostDetailDataStore) {
        destination.selectedPostModel = viewModel
    }
}
