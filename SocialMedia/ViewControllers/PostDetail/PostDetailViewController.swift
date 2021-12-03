//
//  PostDetailViewController.swift
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

protocol PostDetailDisplayLogic: AnyObject {
    func displayPostDetail(rowList: [PostDetailTableViewRows], commentCount: Int)
}

final class PostDetailViewController: UIViewController, PostDetailDisplayLogic {
    
    var interactor: PostDetailBusinessLogic?
    var router: (NSObjectProtocol & PostDetailRoutingLogic & PostDetailDataPassing)?
    
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewCellsModel: [PostDetailTableViewRows] = []
    private var shouldShowCommments: Bool = false
    private var commentCount: Int = 0
    
    // MARK: Object lifecycle
    
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
        let interactor = PostDetailInteractor()
        let presenter = PostDetailPresenter()
        let router = PostDetailRouter()
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
        
        tableView.dataSource = self
        tableView.delegate = self
        
        registerTableViewCells()
        
        interactor?.getPostDetail()
    }
    
    // Display Methods
    
    func displayPostDetail(rowList: [PostDetailTableViewRows], commentCount: Int) {
        tableViewCellsModel = rowList
        self.commentCount = commentCount
        tableView.reloadData()
    }
}

extension PostDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shouldShowCommments ? tableViewCellsModel.count : tableViewCellsModel.count - commentCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType: PostDetailTableViewRows = tableViewCellsModel[indexPath.row]
        switch rowType {
        case .profileCell(let viewModel):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SingleImageViewCell") as? SingleImageViewCell {
                cell.configure(with: viewModel)
                cell.selectionStyle = .none
                return cell
            }
            
        case .descriptionCell(let viewModel), .commentSummaryCell(let viewModel), .commentCell(let viewModel):
            if let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleItemViewCell") as? SimpleItemViewCell {
                cell.configure(with: viewModel)
                cell.selectionStyle = .none
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rowType: PostDetailTableViewRows = tableViewCellsModel[indexPath.row]
        
        switch rowType {
        case .commentSummaryCell:
            shouldShowCommments = !shouldShowCommments
            tableView.reloadData()
            
        default:
            break
        }
    }
    
    private func registerTableViewCells() {
        tableView.register(UINib(nibName: String(describing: SingleImageViewCell.self), bundle: nil), forCellReuseIdentifier: "SingleImageViewCell")
        tableView.register(UINib(nibName: String(describing: SimpleItemViewCell.self), bundle: nil), forCellReuseIdentifier: "SimpleItemViewCell")
    }
}
