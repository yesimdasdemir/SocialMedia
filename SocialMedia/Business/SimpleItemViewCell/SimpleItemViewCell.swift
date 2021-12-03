//
//  SimpleItemViewCell.swift
//  SocialMedia
//
//  Created by Yeşim Daşdemir on 22.11.2021.
//

import UIKit

final class SimpleItemViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    @IBOutlet private weak var iconView: UIImageView!
    
    func configure(with model: SimpleItemViewModel?) {
        guard let viewModel = model else {
            return
        }
        initView(viewModel: viewModel)
    }
    
    private func initView(viewModel: SimpleItemViewModel) {
        
        if let title = viewModel.title {
            titleLabel.text = title
        } else {
            titleLabel.text = ""
        }
        
        if let subTitle = viewModel.subTitle {
            subTitleLabel.text = subTitle
        } else {
            subTitleLabel.text = ""
        }
        
        if let iconName = viewModel.iconName, !iconName.isEmpty {
            iconView.isHidden = false
            iconView.image = UIImage(named: iconName)
        } else {
            iconView.isHidden = true
        }
    }
}
