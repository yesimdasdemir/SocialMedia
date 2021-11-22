//
//  PostListViewController.swift
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

protocol PostListDisplayLogic: AnyObject {
    func displayPostList(viewModel: [SimpleItemViewModel])
}

final class PostListViewController: UIViewController, PostListDisplayLogic {
    var interactor: PostListBusinessLogic?
    var router: (NSObjectProtocol & PostListRoutingLogic & PostListDataPassing)?
    
    @IBOutlet private weak var tableView: UITableView!
    // MARK: Object lifecycle
    
    var postViewModel: [SimpleItemViewModel]?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = PostListInteractor()
        let presenter = PostListPresenter()
        let router = PostListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Lastest Posts"
        tableView.dataSource = self
        tableView.delegate = self
        
        registerTableViewCells()
        interactor?.getPostList()
    }
    
    func displayPostList(viewModel: [SimpleItemViewModel]) {
        postViewModel = viewModel
        tableView.reloadData()
    }

    // MARK: Routing
}

extension PostListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleItemViewCell") as? SimpleItemViewCell {
            if let postModel = postViewModel?[indexPath.row] {
                cell.configure(with: postModel)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedItem = postViewModel?[indexPath.row] else {
            return
        }
        
        router?.routeToPostDetail(viewModel: selectedItem)
    }

    private func registerTableViewCells() {
        let nibName = String(describing: SimpleItemViewCell.self)
        let cell = UINib(nibName: nibName, bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "SimpleItemViewCell")
    }
}
