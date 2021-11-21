//
//  SimpleItemView.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 21.11.2021.
//

import UIKit

final class SimpleItemView: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    // MARK: Initialize methods
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadNib()
    }
    
    var viewModel: SimpleItemViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            initView(viewModel: viewModel)
        }
    }
    
    private func initView(viewModel: SimpleItemViewModel) {
        
        titleLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
    }
    
    // MARK: LoadNib
    
    private func loadNib() {
        let nibName = String(describing: type(of: self))
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentView)
    }

}
